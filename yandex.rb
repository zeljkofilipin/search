# frozen_string_literal: true

browser = :chrome
keyword = 'croatia'

require './page_object/yandex'
yandex = Yandex.new(browser)

yandex.search(keyword)

require 'awesome_print'
ap yandex.search_results

yandex.close
