module Selenium
  module WebDriver
    class DriverFinder
      class << self
        # Override path method to return nil
        # Avoid Browser#preload when browser is :remote
        def path(_options, _namespace)
          nil
        end
      end
    end
  end
end
