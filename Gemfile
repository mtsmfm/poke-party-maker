source 'https://rubygems.org'

ruby "2.1.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem "virtus"
gem "haml-rails"
gem "omniauth"
gem "enumerize"
gem 'bootstrap-sass', '~> 3.0.1.0.rc'
gem 'jquery-ui-rails'
gem 'chart-js-rails'
group :development, :test do
  gem "erb2haml"
  # https://github.com/jeffkreeftmeijer/fuubar/pull/47
  gem "fuubar", github: 'andreacfm/fuubar'
  # https://github.com/guard/guard/issues/495
  gem "guard-cucumber", github: 'mtsmfm/guard-cucumber', branch: 'run-on-modifications'
  gem "guard-rspec"
  gem "byebug"
  gem "pry-rails"
  gem "rspec-rails", '>= 3.0.0.beta1'
  gem "rspec-core", github: 'rspec/rspec-core'
  gem "tapp"
  gem "spring-commands-rspec", require: false
  gem "spring-commands-cucumber", require: false
end

group :test do
  gem "capybara"
  # https://github.com/cucumber/cucumber-rails/issues/252
  gem 'cucumber-rails', require: false, github: 'cucumber/cucumber-rails'
  gem "faclet"
  gem "factory_girl_rails"
  gem "database_cleaner"
  gem "coveralls", require: false
end
