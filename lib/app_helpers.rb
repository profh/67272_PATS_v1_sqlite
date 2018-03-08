# require needed files
require 'helpers/validations'
require 'helpers/activeable'

# create AppHelpers
module AppHelpers
  include AppHelpers::Validations
  include AppHelpers::Activeable::ClassMethods
  include AppHelpers::Activeable::InstanceMethods
end