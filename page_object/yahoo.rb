# frozen_string_literal: true

require './page_object/search'

# Yahoo page object
class Yahoo < Search
  # elements

  def i_agree_button
    @driver.find_element(name: 'agree')
  end

  def search_box
    @driver.find_element(id: 'ybar-sbq')
  end

  def search_button
    @driver.find_element(id: 'ybar-search')
  end

  # functionality

  def open
    super('https://www.yahoo.com/')
  end

  # perform search
  # open the page, enter the keywork in the search box, submit
  def search(keyword)
    open
    puts "ACTION: click 'I agree' button"
    i_agree_button.click
    puts "ACTION: enter keyword in search box: #{keyword}"
    search_box.send_keys keyword
    puts 'ACTION: click the search button'
    search_button.click
  end
end
