source 'https://rubygems.org'
ruby '2.2.1'
gem 'rails', '4.2.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'bootstrap-sass'
gem 'simple_form'
gem 'email_validator'
gem 'bcrypt-ruby'
gem "gritter", :git => 'git://github.com/vmamaev/gritter.git'

# Validaçàp de CPF e CNPJ
#gem 'brazilian-rails'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end
group :development do
  gem 'better_errors'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'spring-commands-rspec'
end
group :development, :test do
  gem 'shoulda-matchers', require: false
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'cpf_faker'
end
group :production do
  gem 'pg'
  gem 'rails_12factor'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem "chromedriver-helper"
  gem 'selenium-webdriver'
end
