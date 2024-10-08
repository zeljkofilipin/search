# frozen_string_literal: true

browser = ARGV[0].to_sym
keyword = ARGV[1]

require 'selenium-webdriver'
require 'webdrivers'

driver = Selenium::WebDriver.for browser
driver.manage.timeouts.implicit_wait = 5
driver.manage.delete_all_cookies

driver.get 'https://duckduckgo.com/'

search_box = driver.find_element(id: 'search_form_input_homepage')
search_box.send_keys keyword

search_button = driver.find_element(id: 'search_button_homepage')
search_button.click

results = []

(0..9).each do |i|
  result = {}
  result[:url]   = driver.find_element(css: "#r1-#{i} .result__title a").attribute('href')
  result[:title] = driver.find_element(css: "#r1-#{i} .result__title").text
  result[:text]  = driver.find_element(css: "#r1-#{i} .result__snippet").text
  results << result
end

require 'awesome_print'
ap results

driver.quit
