require_relative '../models/address_book'
 
class MenuController
  attr_reader :address_book
 
  def initialize
    @address_book = AddressBook.new
  end
 
  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View Entry Number n"
    puts "6 - Exit"
    print "Enter your selection: "
 
    selection = gets.to_i
    
    case selection
      when 1
        system "cls"
        view_all_entries
        main_menu
      when 2
        system "cls"
        create_entry
        main_menu
      when 3
        system "cls"
        search_entries
        main_menu
      when 4
        system "cls"
        read_csv
        main_menu
      when 5
        system "cls"
        view_entry
        main_menu  
      when 6
        puts "Good-bye!"
        exit(0)
      else
        system "cls"
        puts "Sorry, that is not a valid input"
        main_menu
    end
  end
  def view_all_entries
    address_book.entries.each do |entry|
      system "cls"
      puts entry.to_s
      entry_submenu(entry)
    end
 
    system "cls"
    puts "End of entries"
  end
  
  def view_entry
    print "Enter entry number: "
    entry_num = gets.chomp.to_i
    if entry_num > 0 && entry_num < @address_book.entries.length+1
      puts @address_book.entries[entry_num-1]
    else
      puts "invalid entry"
      view_entry
    end
  end
 
  def create_entry
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp
 
    address_book.add_entry(name, phone, email)
 
    system "cls"
    puts "New entry created"
  end
 
  def search_entries
  end
 
  def read_csv
  end   
  
  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
 
    selection = gets.chomp
 
    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "cls"
        main_menu
      else
        system "cls"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
     end
   end
end