# frozen_string_literal: true

# DuckDuckGo
class DuckDuckGo
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

  def open
    @driver.get 'https://duckduckgo.com/'
  end

  def search(keyword)
    open
    search_box.send_keys keyword
    search_button.click
  end

  def search_box
    @driver.find_element(css: '#search_form_input_homepage')
  end

  def search_button
    @driver.find_element(css: '#search_button_homepage')
  end

  def search_results
    results = []

    (0..9).each do |i|
      result = {}
      result[:url]   = url(i).attribute('href')
      result[:title] = title(i).text
      result[:text]  = text(i).text
      results << result
    end

    results
  end

  def text(int)
    @driver.find_element(css: "#r1-#{int} .result__snippet")
  end

  def title(int)
    @driver.find_element(css: "#r1-#{int} .result__title a")
  end

  def url(int)
    @driver.find_element(css: "#r1-#{int} .result__title a")
  end
end
