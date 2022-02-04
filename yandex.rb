# frozen_string_literal: true

browser = :chrome
keyword = 'croatia'

require './page_object/yandex'
yandex = Yandex.new(browser)

yandex.search(keyword)

search_results = yandex.search_results
yandex.search_results_contain_keyword(search_results, keyword)

require 'awesome_print'
ap search_results

yandex.close
