source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end



gem 'rails', '~> 5.0.1'
gem 'mysql2', '~> 0.4.5'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'faker', '~> 1.7', '>= 1.7.3'
gem 'autoprefixer-rails', '~> 6.7', '>= 6.7.6'
gem 'will_paginate', '~> 3.1', '>= 3.1.5'
gem 'bootstrap-will_paginate', '~> 0.0.10'
gem 'mini_magick', '~> 4.6', '>= 4.6.1'
gem 'carrierwave', '~> 1.0'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.1'
gem 'simple_form', '~> 3.4'
gem 'devise', '~> 4.2'

group :development, :test do
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'byebug', platform: :mri
end

group :test do
  gem 'capybara', '~> 2.13'
end

group :development do 
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'guard', '~> 2.14', '>= 2.14.1'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
  gem 'guard-cucumber', '~> 2.1', '>= 2.1.2'
end

group :production do
  gem 'pg', '~> 0.19.0'
  gem 'rails_12factor', '~> 0.0.3'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
