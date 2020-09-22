source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'bcrypt'
gem 'figaro'
gem 'faraday'
gem 'fast_jsonapi'
gem 'puma', '~> 3.11'
gem 'pg', '>= 0.18', '< 2.0'
gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'pry'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'simplecov'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
