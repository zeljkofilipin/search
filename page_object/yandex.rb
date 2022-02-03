# frozen_string_literal: true

require './page_object/search'

# Yandex
class Yandex < Search
  # elements

  def search_box
    @driver.find_element(css: '#text')
  end

  def search_button
    @driver.find_element(css: '.search2__button')
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

  # functionality

  def open
    super('https://yandex.com/')
  end

  def search_results
    results = []

    search_results_elements.each do |element|
      result = {}
      begin
        result[:url] = url(element).attribute('href')
        result[:title] = title(element).text
        result[:text]  = text(element).text
      rescue Selenium::WebDriver::Error::NoSuchElementError
        # don't stop if the element is not there
        # just go to the next one
      end
      results << result
    end

    results
  end
end
