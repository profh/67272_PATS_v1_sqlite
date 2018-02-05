# require needed files
require './test/sets/animals'
require './test/sets/owners'
require './test/sets/pets'
require './test/sets/medicines'
require './test/sets/medicine_costs'
require './test/sets/animal_medicines'
require './test/sets/procedures'
require './test/sets/procedure_costs'
require './test/sets/visits'
require './test/sets/dosages'
require './test/sets/treatments'
require './test/sets/users'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Animals
  include Contexts::Owners
  include Contexts::Pets
  include Contexts::Medicines
  include Contexts::MedicineCosts
  include Contexts::AnimalMedicines
  include Contexts::Procedures
  include Contexts::ProcedureCosts
  include Contexts::Visits
  include Contexts::Dosages
  include Contexts::Treatments
  include Contexts::Users
end