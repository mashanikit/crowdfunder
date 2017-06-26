ENV['RAILS_ENV'] ||= 'test'

# To generate a test coverage report for the models,
# instead of just the usual `rake` to run tests, use:
# COVERAGE=true rake
require 'simplecov'
if ENV['COVERAGE']
  SimpleCov.start 'rails' do
    add_filter '/controllers|helpers/'
  end
end

# Regular test setup
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# Include sorcery test helpers in controller tests
class ActionController::TestCase
  include Sorcery::TestHelpers::Rails::Integration
  include Sorcery::TestHelpers::Rails::Controller
end

<<<<<<< HEAD
=======

class ActiveSupport::TestCase
>>>>>>> e8dfd961bd140ff9794f4540e2e8272b6b8bfe34

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end
