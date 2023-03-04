gem "rails", "~> 7.0.4.2"

# Gems
gem_group :development do
  gem "solargraph"
  gem "rubocop"
end
gem_group :test do
  gem 'factory_bot_rails'
  gem 'faker'
end
gem 'tailwindcss-rails', '~> 2.0'

# Make sure we are on latest ruby
run "echo 3.2.1 > .ruby-version"

# Don't commit the devenv
run "echo .direnv >> .gitignore"
run "echo .devenv >> .gitignore"
