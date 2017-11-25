source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Ed 20170811 add jquery
gem 'jquery-rails'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  #Ed 20170818 moved to development test block to ensure it only compiles in dev/test environments
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  #20171108 6.1 RSpec
  gem 'rspec-rails', '~> 3.6'

  # 20171120 6.4 Generating Test Data
  gem "factory_bot_rails", "~> 4.0"

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#Ed 20170818 to communicate with PostgreSQL databases
group :production do
  gem 'pg'
end

# 20170929 ED 5.4 authentication
# to install, $ bundle install, after adding the below line and saving this file
gem 'devise'

# 20171005 ED 5.5 Authorization
# install cancancan
gem 'cancancan', '~> 2.0'

#20171022 5.9 Validation & Pagination
#add pagination to your app
gem 'will_paginate', '~> 3.1.0'

#20171115 6.3 Functional Tests
#to be able to run functional tests. Provides assigns and assert_template
gem 'rails-controller-testing'

# 20171124 6.5: Payment Forms with Stripe
gem 'stripe'