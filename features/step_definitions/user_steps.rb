require './test/contexts'
include Contexts

Given /^an initial setup$/ do
  # context used for phase 3 only
  create_animals
  create_owners
  create_pets
  create_visits
end

Given /^no setup yet$/ do
  # assumes initial setup already run as background
  destroy_visits
  destroy_pets
  destroy_owners
  destroy_animals
end
