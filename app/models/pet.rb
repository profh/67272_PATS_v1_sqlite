class Pet < ApplicationRecord
  # Relationships
  # -----------------------------
  belongs_to :animal
  belongs_to :owner
  has_many :visits
  has_many :dosages, through: :visits
  has_many :treatments, through: :visits


  # Scopes
  # -----------------------------
  # order pets by their name
  scope :alphabetical, -> { order('name') }
  # get all the pets we treat (not moved away or dead)
  scope :active, -> { where(active: true) }
  # get all the pets we heave treated that moved away or died
  # scope :inactive, -> { where.not(active: true) }
  # get all the female pets
  scope :females, -> { where(female: true) }

  # get all the pets for a particular owner
  scope :for_owner, ->(owner_id) { where(owner_id: owner_id) }
  # get all the pets who are a particular animal type
  scope :by_animal, ->(animal_id) { where("animal_id = ?", animal_id) }
  # get all the pets born before a certain date
  # scope :born_before, ->(dob) { where('date_of_birth < ?', dob) }


  # Validations
  # -----------------------------
  #
  # First, make sure a name exists
  validates :name, presence: true
  # Second, make sure the animal is one of the types PATS treats
  validate :animal_type_treated_by_PATS
  # Third, make sure the owner_id is in the PATS system 
  # validate :owner_is_active_in_PATS_system
  

  # Misc Methods and Constants
  # -----------------------------
  # a method to get owner name in last, first format
  # def gender
  #   return "Female" if self.female
  #   "Male"
  # end  

  def average_weight
    return nil if self.visits.empty?
    weights = self.visits.map(&:weight)
    return weights.first if weights.count == 1
    avg_weight = (weights.inject(0){|sum,weight| sum += weight}) / weights.count
  end

  def stage_of_life
    return "unknown" if self.date_of_birth.nil?
    if self.date_of_birth > 1.year.ago
      return "child"
    elsif self.date_of_birth > 3.year.ago
      return "adolescent"
    elsif self.date_of_birth > 13.year.ago
      return "adult" 
    else
      return "senior"
    end
  end



  # Use private methods to execute the custom validations
  # -----------------------------
  private
  def animal_type_treated_by_PATS
    # get an array of all animal ids PATS treats
    treated_animal_ids = Animal.all.map{|a| a.id}
    # add error unless the animal id of the pet is in the array of possible animal ids
    unless treated_animal_ids.include?(self.animal_id)
      errors.add(:animal, "is an animal type not treated by PATS")
    end
  end
  
  # def owner_is_active_in_PATS_system
  #   # get an array of all active owners in the PATS system
  #   all_owner_ids = Owner.active.all.map{|o| o.id}
  #   # add error unless the owner id of the pet is in the array of active owners
  #   unless all_owner_ids.include?(self.owner_id)
  #     errors.add(:owner, "is not an active owner in PATS")
  #   end
  # end
end
