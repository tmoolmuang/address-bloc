require_relative 'controllers/menu_controller'
 
menu = MenuController.new
system "cls"
puts "Welcome to AddressBloc!"
menu.main_menu
