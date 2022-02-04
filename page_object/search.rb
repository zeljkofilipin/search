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

  def open(url)
    @driver.get url
  end

  def popular(results1, results2)
    popular = []

    results1.each do |v1|
      results2.each do |v2|
        popular << v2[:url] if v1[:url] == v2[:url]
      end
    end

    popular
  end

  def search(keyword)
    open
    search_box.send_keys keyword
    search_button.click
  end

  def search_result_contains_keyword(result, keyword)
    has_keyword = false

    result.each do |_k, v|
      has_keyword = true if v.downcase.include?(keyword)
    end

    result[:keyword] = has_keyword
  end

  def search_results_contain_keyword(results, keyword)
    results.each do |result|
      search_result_contains_keyword(result, keyword)
    end
  end

  def urls_and_keywords(results)
    urls_and_keywords = []

    results.each do |e|
      urls_and_keywords << { url: e[:url], keyword: e[:keyword] }
    end

    urls_and_keywords
  end
end
