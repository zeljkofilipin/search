# frozen_string_literal: true

browser = :chrome
keyword = 'croatia'

require './page_object/duckduckgo'
duckduckgo = DuckDuckGo.new(browser)

duckduckgo.search(keyword)

duckduckgo_search_results = duckduckgo.search_results
duckduckgo.search_results_contain_keyword(duckduckgo_search_results, keyword)

require 'awesome_print'
ap duckduckgo_search_results

duckduckgo.close

require './page_object/yandex'
yandex = Yandex.new(browser)

yandex.search(keyword)

yandex_search_results = yandex.search_results
yandex.search_results_contain_keyword(yandex_search_results, keyword)

ap yandex_search_results

ap yandex.popular(duckduckgo_search_results, yandex_search_results)

yandex.close
