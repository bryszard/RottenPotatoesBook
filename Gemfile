source 'https://rubygems.org'

ruby '2.2.2'
gem 'rails', '4.2.1'
# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'ZenTest', '~> 4.11'
  gem 'hoe', '~> 3.14', '>= 3.14.2'
  gem 'minitest', '~> 5.8', '>= 5.8.4'
  gem 'rdoc', '~> 4.2', '>= 4.2.1'
  gem 'autotest', '~> 4.4', '>= 4.4.6'
  gem "factory_girl_rails", "~> 4.0"
end

group :test do
  gem 'cucumber-rails' , :require => false
  gem 'cucumber-rails-training-wheels'
end
group :production do
#  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.

  #gem 'therubyracer', '~> 0.12.0'
gem 'sass-rails', '~> 5.0.3'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '>= 2.7.1'

gem 'jquery-rails'
gem 'haml'
gem 'protected_attributes'

gem 'omniauth'
gem 'omniauth-twitter'

gem 'themoviedb'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'
