# frozen_string_literal: true

browser = :chrome
keyword = 'croatia'

require './page_object/baidu'
# engine = Baidu.new(browser)

require './page_object/bing'
# engine = Bing.new(browser)

require './page_object/duckduckgo'
# engine = DuckDuckGo.new(browser)

require './page_object/google'
# engine = Google.new(browser)

require './page_object/yahoo'
# engine = Yahoo.new(browser)

require './page_object/yandex'
engine = Yandex.new(browser)

engine.search(keyword)

search_results = engine.search_results
engine.search_results_contain_keyword(search_results, keyword)

require 'awesome_print'
ap search_results

engine.close
