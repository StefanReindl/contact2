require 'pg'

require_relative './contact'
 
puts "establishing connection ..."
conn = PG.connect(
  dbname: 'd3nqgb5l6q2f99',
  port: 5432,
  user: 'qknduyskzoktli',
  host: 'ec2-54-197-249-167.compute-1.amazonaws.com',
  password: 'DjbLZLMo-tXNQFUZ2lCurm5UTd'
)

Contact.connection = conn

contact = Contact.new('Benno', 'Reindl', 'update8@gmail.com')
contact.save

# puts Contact.find(19)

# puts Contact.all.inspect
 
conn.close