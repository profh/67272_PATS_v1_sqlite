require 'test_helper'

class PetTest < ActiveSupport::TestCase

  should belong_to(:owner)
  should belong_to(:animal)
  should have_many(:visits)
  should have_many(:dosages).through(:visits)
  should have_many(:treatments).through(:visits)
  
  should validate_presence_of(:name)
 
  context "Given context" do

    setup do 
      create_animals
      create_owners
      create_pets
    end
    
    teardown do
      destroy_pets
      destroy_animals
      destroy_owners
    end
  
    should "have all the pets are listed here in alphabetical order" do
      assert_equal 3, Pet.all.size # quick check of size
      assert_equal ["Dusty", "Polo", "Pork Chop"], Pet.alphabetical.map{|p| p.name}
    end
    
    should "have all active pets accounted for" do
      assert_equal 2, Pet.active.size 
    end
    
    should "properly handle gender named scopes" do
      assert_equal(2, Pet.females.size)
    end
    
    should "have a scope for_owner that works" do
      assert_equal 1, Pet.for_owner(@mark.id).size
      assert_equal 2, Pet.for_owner(@alex.id).size
    end    
    
    should "have a scope by_animal that works" do
      assert_equal 1, Pet.by_animal(@dog.id).size
      assert_equal 2, Pet.by_animal(@cat.id).size
    end
    
    should "have method stage_of_life that works" do
      assert_equal "senior", @dusty.stage_of_life
      assert_equal "adult", @polo.stage_of_life
      assert_equal "child", @pork_chop.stage_of_life

      @dusty.date_of_birth = 155.weeks.ago.to_date
      assert_equal "adolescent", @dusty.stage_of_life
      @dusty.date_of_birth = nil
      assert_equal "unknown", @dusty.stage_of_life
    end

    should "have method average_weight that works" do
      create_visits
      assert_equal 9.5, @dusty.average_weight
      assert_equal 6.0, @polo.average_weight
      assert_nil @pork_chop.average_weight
      destroy_visits
    end
    
    should "identify a non-PATS animal type as invalid" do
      hampster = FactoryBot.create(:animal, name: "Hampster")
      hampster_pet = FactoryBot.build(:pet, animal: hampster, owner: @mark, name: "Smurf")
      assert hampster_pet.valid?
      snake = FactoryBot.build(:animal, name: "Corn Snake")
      snake_pet = FactoryBot.build(:pet, animal: snake, owner: @mark)
      deny snake_pet.valid?
    end
  end
end
