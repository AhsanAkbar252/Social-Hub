# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

begin
  require 'minitest/autorun'
rescue LoadError => e
  raise e unless ENV['RAILS_ENV'] == "production"
end

Rails.application.load_tasks
