# frozen_string_literal: true

browser = ARGV[0].to_sym
keyword = ARGV[1]

require 'selenium-webdriver'
require 'webdrivers'

driver = Selenium::WebDriver.for browser
driver.manage.timeouts.implicit_wait = 5
driver.manage.delete_all_cookies

driver.get 'https://www.google.com/'

i_agree_button = driver.find_element(id: 'L2AGLb')
i_agree_button.click

search_box = driver.find_element(name: 'q')
search_box.send_keys keyword

search_button = driver.find_elements(name: 'btnK')[1]
search_button.click

results = []

driver.find_elements(css: 'div.yuRUbf a[ping]').each do |element|
  result = {}

  title = element.find_element(css: 'h3').text
  next unless title != ''

  result[:title] = title
  result[:url] = element.attribute('href')
  results << result
end

require 'awesome_print'
ap results

driver.quit
