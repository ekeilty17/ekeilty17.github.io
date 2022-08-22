source "https://rubygems.org"

#gem "jekyll", "~> 4.2.2"
#gem "minima", "~> 2.5"

# If you have any plugins, put them here!
gem "github-pages", "~> 3.9.2", group: :jekyll_plugins
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
end

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]

gem "webrick", "~> 1.7"
