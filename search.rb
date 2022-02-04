# frozen_string_literal: true

browser = :chrome
keyword = 'croatia'

require './page_object/duckduckgo'
duckduckgo = DuckDuckGo.new(browser)

duckduckgo.search(keyword)

duckduckgo_search_results = duckduckgo.search_results
duckduckgo.search_results_contain_keyword(duckduckgo_search_results, keyword)

puts "-" * 80
puts "DuckDuckGo search results that contain the keyword"
puts "-" * 80
require 'awesome_print'
ap duckduckgo.urls_and_keywords(duckduckgo_search_results)

duckduckgo.close

require './page_object/yandex'
yandex = Yandex.new(browser)

yandex.search(keyword)

yandex_search_results = yandex.search_results
yandex.search_results_contain_keyword(yandex_search_results, keyword)

puts "-" * 80
puts "Yandex search results that contain the keyword"
puts "-" * 80
ap yandex.urls_and_keywords(yandex_search_results)

puts "-" * 80
puts "Search results from both search engines"
puts "-" * 80
ap yandex.popular(duckduckgo_search_results, yandex_search_results)

yandex.close
