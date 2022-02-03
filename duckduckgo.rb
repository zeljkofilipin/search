# frozen_string_literal: true

browser = :chrome
keyword = 'croatia'

require './page_object/duckduckgo'
duckduckgo = DuckDuckGo.new(browser)

duckduckgo.search(keyword)

require 'awesome_print'
ap duckduckgo.search_results

duckduckgo.close
