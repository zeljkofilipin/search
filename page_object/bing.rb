# frozen_string_literal: true

require './page_object/search'

# Bing page object
class Bing < Search
  # elements

  def search_box
    @driver.find_element(css: '#sb_form_q')
  end

  def search_button
    @driver.find_element(css: '#search_icon')
  end

  # functionality

  def open
    super('https://www.google.com/')
  end
end
