# frozen_string_literal: true

# Yandex
class Yandex
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
    @driver.get 'https://yandex.com/'
  end

  def search(keyword)
    open
    search_box.send_keys keyword
    search_button.click
  end

  def search_box
    @driver.find_element(css: '#text')
  end

  def search_button
    @driver.find_element(css: '.search2__button')
  end

  def search_results
    results = []

    search_results_elements.each do |element|
      result = {}
      begin
        result[:url] = url(element).attribute('href')
        result[:title] = title(element).text
        result[:text]  = text(element).text
      rescue Selenium::WebDriver::Error::NoSuchElementError => e
        # don't stop if the element is not there
        # just go to the next one
      end
      results << result
    end

    results
  end

  def search_results_elements
    @driver.find_elements(css: '#search-result [data-fast]')
  end

  def text(parent)
    parent.find_element(css: '.organic__content-wrapper')
  end

  def title(parent)
    parent.find_element(css: '.organic__title')
  end

  def url(parent)
    parent.find_element(css: '.organic__url')
  end
end
