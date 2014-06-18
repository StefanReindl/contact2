require 'pg'
require 'pry'
require 'active_record'
require_relative './contact'
require_relative './application'

ActiveRecord::Base.logger = Logger.new(STDOUT)
 
puts "Establishing connection to database ..."
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'd3nqgb5l6q2f99',
  username: 'qknduyskzoktli',
  password: 'DjbLZLMo-tXNQFUZ2lCurm5UTd',
  host: 'ec2-54-197-249-167.compute-1.amazonaws.com',
  port: 5432,
  min_messages: 'error'
)
puts "CONNECTED"

puts "Setting up Database (recreating tables) ..."

ActiveRecord::Schema.define do
  drop_table :contacts if ActiveRecord::Base.connection.table_exists?(:contacts)
  create_table :contacts do |t|
    t.column :firstname, :string
    t.column :lastname, :string
    t.column :email, :string
    t.timestamps
  end
end

puts "Setup DONE"

Application.new.run
