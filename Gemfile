source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# gem 'mysql2', '>= 0.4.4', group: :development
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
# gem 'bootstrap'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'rails-i18n', '~> 6.0'
gem 'devise-i18n'
gem 'faker'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'jquery-rails'
gem 'omniauth', '1.9.1'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'
gem 'font-awesome-sass'
# gem 'bootstrap-sass'
gem 'data-confirm-modal'
gem 'dotenv-rails'
gem 'mini_magick'
gem 'image_processing', '~>1.2'
gem 'kaminari'
# gem 'bootswatch', github: "thomaspark/bootswatch"
gem "gretel"
gem 'ransack'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'rails-controller-testing'
  gem 'rubocop-airbnb'
  gem "factory_bot_rails", "~> 4.10.0"
  gem 'sqlite3'
end

group :development do
  gem 'spring-commands-rspec'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener_web'

end

group :production do
 gem 'pg'
 gem 'fog', '1.42'
end

group :test do
 gem 'capybara', '>= 2.15'
 gem 'selenium-webdriver'
#  gem 'rspec-rails'
end