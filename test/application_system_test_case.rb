require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # By default, selenium-webdriver will try to connect to a WebDriver in localhost.
  # The options set will change that to point it to a remote address.
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: {
    browser: :remote,
    url: "http://chrome-server:4444"
  }
end
