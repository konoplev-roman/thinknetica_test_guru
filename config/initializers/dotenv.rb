if %w(development test).include? ENV['RAILS_ENV']
  Dotenv.require_keys('GITHUB_TOKEN')
end
