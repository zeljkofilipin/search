# frozen_string_literal: true

browser = ARGV[0].to_sym
keyword = ARGV[1]

require 'selenium-webdriver'
require 'webdrivers'

driver = Selenium::WebDriver.for browser
driver.manage.delete_all_cookies

driver.get 'https://www.bing.com/'

search_box = driver.find_element(id: 'sb_form_q')
search_button = driver.find_element(id: 'search_icon')

wait = Selenium::WebDriver::Wait.new(timeout: 5)
wait.until { search_button.enabled? }

search_box.send_keys keyword
search_button.click

results = []

driver.find_elements(css: '#b_results li.b_algo').each do |element|
  result = {}
  result[:url] = element.find_element(css: 'h2 a').attribute('href')
  result[:title] = element.find_element(css: 'h2 a').text
  result[:text] = driver.find_element(css: 'p.b_paractl').text
  results << result
end

require 'pp'
pp results

driver.quit
