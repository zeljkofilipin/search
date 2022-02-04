# frozen_string_literal: true

# base page object
# contains all common functionality
class Search
  # open the browser
  def initialize(browser)
    puts 'ACTION: open browser'
    require 'selenium-webdriver'
    require 'webdrivers'
    driver = Selenium::WebDriver.for browser
    driver.manage.timeouts.implicit_wait = 5
    driver.manage.delete_all_cookies

    @driver = driver
  end

  # close the browser
  def close
    puts 'ACTION: close browser'
    @driver.quit
  end

  # open the url
  def open(url)
    puts "ACTION: open #{url}"
    @driver.get url
  end

  # compare search results from two search engines
  # return array with urls that are present in both results
  def popular(results1, results2)
    popular = []

    results1.each do |v1|
      results2.each do |v2|
        popular << v2[:url] if v1[:url] == v2[:url]
      end
    end

    popular
  end

  # perform search
  # open the page, enter the keywork in the search box, submit
  def search(keyword)
    open
    puts "ACTION: enter keyword in search box: #{keyword}"
    search_box.send_keys keyword
    puts 'ACTION: click the search button'
    search_button.click
  end

  # check if url, title or description of one result contain the keyword
  # add `:keyword` to the hash with value `true` or `false`
  # return the hash
  def search_result_contains_keyword(result, keyword)
    has_keyword = false

    result.each do |_k, v|
      has_keyword = true if v.downcase.include?(keyword)
    end

    result[:keyword] = has_keyword
  end

  # iterate over all results
  # check if url, title or description contain the keyword
  # return the modified hash with a new key `:keyword` with value `true` or `false`
  def search_results_contain_keyword(results, keyword)
    results.each do |result|
      search_result_contains_keyword(result, keyword)
    end
  end

  # create a new array of hashes
  # it contains only `:url` and `:keyword` keys
  # suitable for outputing to the screen
  # return the array
  def urls_and_keywords(results)
    urls_and_keywords = []

    results.each do |e|
      urls_and_keywords << { url: e[:url], keyword: e[:keyword] }
    end

    urls_and_keywords
  end
end
