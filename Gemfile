source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

gem 'rails', '5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.0'
gem 'mechanize'
gem 'nokogiri'
gem 'devise_token_auth'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
