source 'http://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'ruby-debug19'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'haml'

#for testing
group :test, :development do
    gem 'cucumber-rails'
    gem 'cucumber-rails-training-wheels' #some pre-fabbed step definitions
    gem 'database_cleaner' #to clear Cucumber's test database between runs
    gem 'capybara'  #lets Cucumber pretend to be a web browser
    gem 'launchy'    #a useful debugging aid for user stories
end
# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'
