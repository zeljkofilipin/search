# Search Engine

Search for a keyword. Get the the first ten results. Get URL, title and description of each of the results.

## Installation

Install [Ruby](https://www.ruby-lang.org/en/). (The script is tested with v3.0.3p157.)
Install a browser. (Default: Chrome.)

Install dependencies with: `bundle`

## Usage

Configure `browser` (default `:chrome`) and `keyword` (default: `croatia`) in `search.rb`.

Run the script with: `bundle exec ruby search.rb`

## Search Engines

According to [Wikipedia](https://en.wikipedia.org/wiki/Search_engine#Market_share), the most popular search engines are [Google](https://www.google.com/) (92% market share), [Bing](https://www.bing.com/) (3%), [Yahoo](https://www.yahoo.com/) (2%), [Baidu](https://www.baidu.com/) (1%), [Yandex](https://yandex.com/) (1%) and [DuckDuckGo](https://duckduckgo.com/) (1%).

Google search results page always returned 10 search results, but it was surprisingly hard to parse. I didn't see any obvious was to find results. I could find URL and related title and I could find description, but separately. I could not find a good way to find all three.

Bing was strange. It sometimes returned less than 10 results, even for the same query.

Yahoo returned only one search result by default. 5 search results per page appeared after scrolling.

Baidu was all in Chinese. I could not find a way to switch the language. It also had a captcha.

Yandex was reasonable easy to automate.

DuckDuckGo was the easiest to automate. It always returned 10 results and it was easy to get the data.

I have decided to automate Yandex and DuckDuckGo.
