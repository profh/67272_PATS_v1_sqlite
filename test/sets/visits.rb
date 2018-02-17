module Contexts
  module Visits

    def create_visits
      @visit1 = FactoryBot.create(:visit, pet: @dusty, weight: 9.5)
      @visit2 = FactoryBot.create(:visit, pet: @polo, date: 5.months.ago.to_date, weight: 7.0)
      @visit3 = FactoryBot.create(:visit, pet: @polo, date: 2.months.ago.to_date)    
    end
    
    def destroy_visits
      @visit1.delete
      @visit2.delete
      @visit3.delete
    end

  end
end