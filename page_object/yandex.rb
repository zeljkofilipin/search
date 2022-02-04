# frozen_string_literal: true

require './page_object/search'

# Yandex page object
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

  # put each search result in a separate hash
  # return the hash
  def search_result(element)
    result = {}

    begin
      result[:url] = url(element).attribute('href')
      result[:title] = title(element).text
      result[:text]  = text(element).text
    rescue Selenium::WebDriver::Error::NoSuchElementError
      # don't stop if the element is not there
      # just go to the next one
    end

    result
  end

  # get search results from the page
  # return array of hashes containing search results
  def search_results
    puts 'ACTION: get search results (url, title, text)'
    results = []

    search_results_elements.each do |element|
      results << search_result(element)
    end

    results
  end
end
