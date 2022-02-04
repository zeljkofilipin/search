# frozen_string_literal: true

require './page_object/search'

# DuckDuckGo page object
class DuckDuckGo < Search
  # elements

  def search_box
    @driver.find_element(css: '#search_form_input_homepage')
  end

  def search_button
    @driver.find_element(css: '#search_button_homepage')
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

  # functionality

  def open
    super('https://duckduckgo.com/')
  end

  # put each search result in a separate hash
  # return the hash
  def search_result(int)
    result = {}

    result[:url]   = url(int).attribute('href')
    result[:title] = title(int).text
    result[:text]  = text(int).text

    result
  end

  # get search results from the page
  # return array of hashes containing search results
  def search_results
    results = []

    (0..9).each do |i|
      results << search_result(i)
    end

    results
  end
end
