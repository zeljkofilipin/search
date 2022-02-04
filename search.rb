# frozen_string_literal: true

# configre browser and keyword
browser = :chrome
keyword = 'croatia'

# open browser and go to the search engine
require './page_object/duckduckgo'
duckduckgo = DuckDuckGo.new(browser)

# search for the keyword
duckduckgo.search(keyword)

# store search results in a variable
duckduckgo_search_results = duckduckgo.search_results

# check if search results contain the keyword
duckduckgo.search_results_contain_keyword(duckduckgo_search_results, keyword)

# output search results and if they contain the keyword
puts ''
puts '-' * 80
puts 'DuckDuckGo search results and if they contain the keyword'
puts '-' * 80
require 'awesome_print'
ap duckduckgo.urls_and_keywords(duckduckgo_search_results)
puts ''

# close the browser
duckduckgo.close

# open browser and go to the search engine
require './page_object/yandex'
yandex = Yandex.new(browser)

# search for the keyword
yandex.search(keyword)

# store search results in a variable
yandex_search_results = yandex.search_results

# check if search results contain the keyword
yandex.search_results_contain_keyword(yandex_search_results, keyword)

# output search results and if they contain the keyword
puts ''
puts '-' * 80
puts 'Yandex search results and if they contain the keyword'
puts '-' * 80
ap yandex.urls_and_keywords(yandex_search_results)
puts ''

# output search results that are in both search engines
puts ''
puts '-' * 80
puts 'Search results from both search engines'
puts '-' * 80
ap yandex.popular(duckduckgo_search_results, yandex_search_results)
puts ''

# close the browser
yandex.close
