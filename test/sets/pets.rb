module Contexts
  module Pets

    def create_pets
      @dusty = FactoryBot.create(:pet, animal: @cat, owner: @alex, female: false, date_of_birth: 13.years.ago.to_date)
      @polo = FactoryBot.create(:pet, animal: @cat, owner: @alex, name: "Polo", active: false, date_of_birth: 3.years.ago.to_date)
      @pork_chop = FactoryBot.create(:pet, animal: @dog, owner: @mark, name: "Pork Chop", date_of_birth: 51.weeks.ago.to_date)
    end
    
    def destroy_pets
      @dusty.destroy
      @polo.destroy
      @pork_chop.destroy
    end

  end
end