require 'sequel'
require 'sqlite3'
require './app/models/task_manager'
environments = %w(test development)

environments.each do |env|
  Sequel.sqlite("db/task_manager_#{env}.sqlite3").create_table :tasks do
    primary_key   :id
    String        :title
    String        :description
  end
  puts "creating tasks table for #{env}"
end