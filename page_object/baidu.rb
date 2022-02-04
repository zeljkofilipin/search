# frozen_string_literal: true

require './page_object/search'

# Bing page object
class Baidu < Search
  # elements

  def search_box
    @driver.find_element(css: '#kw')
  end

  def search_button
    @driver.find_element(css: '#su')
  end

  # functionality

  def open
    super('https://www.baidu.com/')
  end
end
