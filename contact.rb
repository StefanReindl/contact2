class Contact
 
  attr_accessor :firstname, :lastname, :email, :id
 
  def initialize(firstname, lastname, email)
    @firstname = firstname
    @lastname = lastname
    @email = email
  end

   def self.connection= conn
    @@db = conn
  end

  def self.all
    results = @@db.exec("SELECT * FROM contacts")
    results.to_a
  end

  def save
    if self.id
      @@db.exec("UPDATE contacts SET email = '#{@email}', firstname = '#{@firstname}', lastname = '#{@lastname}' WHERE id = #{@id};")
      puts "Contact updated!\n#{@firstname} #{@lastname}, email: #{@email}"
    else
      result = @@db.exec("INSERT INTO contacts (firstname, lastname, email) VALUES ('#{@firstname}', '#{@lastname}', '#{@email}') RETURNING id;")
      result[0]['id'] = @id
      puts "Contact added!\n#{@firstname} #{@lastname}, email: #{@email}"
    end
  end

  def self.find(id)
    results = @@db.exec("SELECT * FROM contacts WHERE id = #{id}")
    results.to_a
  end

  # def destroy
  # end

  # def self.find_all_by_lastname(name)
  # end

  # def self.find_all_by_firstname(name)
  # end

  # def self.find_by_email(email)
  # end
 

end