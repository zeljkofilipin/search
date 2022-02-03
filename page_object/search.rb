# frozen_string_literal: true

# Search
class Search
  def initialize(browser)
    require 'selenium-webdriver'
    require 'webdrivers'
    driver = Selenium::WebDriver.for browser
    driver.manage.timeouts.implicit_wait = 5
    driver.manage.delete_all_cookies

    @driver = driver
  end

  def close
    @driver.quit
  end

  def search(keyword)
    open
    search_box.send_keys keyword
    search_button.click
  end
end
