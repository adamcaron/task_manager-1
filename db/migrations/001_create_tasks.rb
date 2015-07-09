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

# only way to hit both environments in one call is to loop
# through and just change the file names
# otherwise we are only getting one of them and would have to do two migrations

# important to understand that the test and the development environment are independent
