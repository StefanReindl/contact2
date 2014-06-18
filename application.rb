class Application 
 
  def run
    show_main_menu
    input = gets.chomp.downcase
    case input
      when 'quit'
        abort("Good-bye")
      when 'new'
        puts "What is the contact's first name?"
        @firstname = gets.chomp.downcase
        puts "What is the contact's last name?"
        @lastname = gets.chomp.downcase
        puts "What is the contact's email?"
        @email = gets.chomp.downcase
        contact = Contact.create(firstname: "#{@firstname}", lastname: "#{@lastname}", email: "#{@email}")
        contact.save
        contact.inspect
        puts "Contact created: #{@firstname} #{@lastname}, email: #{@email}"
        run
      when 'list'
        puts Contact.all.inspect
        run
      when 'find id'
        puts "What ID number?"
        id = gets.chomp.to_i
        puts Contact.find(id).inspect
        run
      when 'by name'
        puts "Firstname or lastname?"
        nametype = gets.chomp.downcase
        case nametype
          when "firstname"
            puts "What firstname?"
            firstname = gets.chomp.downcase
            contact = Contact.where({firstname: "#{firstname}"})
          when "lastname"
            puts "What lastname?"
            lastname = gets.chomp.downcase
            contact = Contact.where({lastname: "#{lastname}"})
          else puts "Invalid input"
            run
        end
        puts contact.inspect
        run
      when 'by email'
        puts "Enter email"
        @email = gets.chomp.downcase
        contact = Contact.where({email: "#{@email}"})
        puts contact.inspect
        run
      when 'update'
        puts "What is the contact's ID?"
        id = gets.chomp.to_i
        contact = Contact.find(id)
        puts "What is the contact's first name?"
        contact.firstname = gets.chomp.downcase
        puts "What is the contact's last name?"
        contact.lastname = gets.chomp.downcase
        puts "What is the contact's email?"
        contact.email = gets.chomp.downcase
        contact.save
        run
       when 'delete'
        puts "Which contact ID to delete?"
        id = gets.chomp.to_i
        contact = Contact.find(id)
        contact.delete
        puts "Contact deleted!"
        run
      else puts "Invalid input"
        run
    end
  end
 
  private
 
  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new      - Create a new contact"
    puts " update   - Update existing contact"
    puts " list     - List all contacts"
    puts " find id  - Show info for contact ID number"
    puts " by name  - Search for contact by first or last name"
    puts " by email - Search for contact by email"
    puts " delete   - Delete a contact by ID number"
    puts " quit     - Exit Application"
    print "> "
  end


end