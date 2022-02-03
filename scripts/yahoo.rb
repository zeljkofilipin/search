# frozen_string_literal: true

browser = ARGV[0].to_sym
keyword = ARGV[1]

require 'selenium-webdriver'
require 'webdrivers'

driver = Selenium::WebDriver.for browser
driver.manage.timeouts.implicit_wait = 5
driver.manage.delete_all_cookies

driver.get 'https://www.yahoo.com/'

i_agree_button = driver.find_element(name: 'agree')
i_agree_button.click

search_box = driver.find_element(id: 'ybar-sbq')
search_box.send_keys keyword

search_button = driver.find_element(id: 'ybar-search')
search_button.click

results = []

driver.find_elements(css: 'h3 [data-matarget]').each do |element|
  result = {}

  url = element.attribute('href')

  result[:url] = url
  results << result
end

require 'awesome_print'
ap results

driver.quit
