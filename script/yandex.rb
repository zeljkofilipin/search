# frozen_string_literal: true

browser = ARGV[0].to_sym
keyword = ARGV[1]

require 'selenium-webdriver'
require 'webdrivers'

driver = Selenium::WebDriver.for browser
driver.manage.timeouts.implicit_wait = 5
driver.manage.delete_all_cookies

driver.get 'https://yandex.com/'

search_box = driver.find_element(id: 'text')
search_box.send_keys keyword

search_button = driver.find_element(class: 'search2__button')
search_button.click

results = []

driver.find_elements(css: '#search-result [data-fast] .organic__url').each do |element|
  result = {}
  result[:url] = element.attribute('href')
  results << result
end

require 'awesome_print'
ap results

driver.quit
