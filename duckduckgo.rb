# frozen_string_literal: true

browser = :chrome
keyword = 'croatia'

require './page_object/duckduckgo'
duckduckgo = DuckDuckGo.new(browser)

duckduckgo.search(keyword)

search_results = duckduckgo.search_results
duckduckgo.search_results_contain_keyword(search_results, keyword)

require 'awesome_print'
ap search_results

duckduckgo.close
