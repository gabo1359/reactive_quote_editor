ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...

    # By default, Rails binds the server to the IP address 127.0.0.1, which is only locally accessible,
    # making it impossible for the web browser running in another container to access the Rails application.
    # To fix that, we set Capybara’s server_host to 0.0.0.0, which is accessible over the network.
    Capybara.server_host = "0.0.0.0"

    # app_host by default is set to the server_host. The problem is that the address 0.0.0.0 in the
    # web browser container doesn’t point to the Rails application.
    # So we set app_host to the address of the web service by using the HOSTNAME environment variable
    # plus the port chosen by Capybara.
    Capybara.app_host = "http://#{ENV.fetch("HOSTNAME")}:#{Capybara.server_port}"
  end
end
