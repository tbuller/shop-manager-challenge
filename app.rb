# file: app.rb

require_relative './lib/orders'
require_relative './lib/items'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, orders, items)
    DatabaseConnection.connect(database_name)
    @io = io
    @orders = orders
    @items = items
  end

  def run
    items = ItemRepo.new
    orders = OrderRepo.new
    @io.puts "Welcome to the shop management program
          
What do you want to do?
  1 = list all shop items
  2 = create a new item
  3 = list all orders
  4 = create a new order"
    input = @io.gets.chomp.to_i

    if input == 1
      items.all.map { |i| print "#{i.id} product: #{i.name.upcase} - price: £#{i.unit_price} - quantity: #{i.quantity}\n" }
    elsif input == 3
      orders.all.map { |o| print "#{o.id} #{o.customer_name} - date: #{o.order_date} - product: #{items.all[o.item_id.to_i - 1].name}\n" }
    else
      puts "wrong number"  
    end  

    
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'shop-manager',
    Kernel,
    OrderRepo.new,
    ItemRepo.new
  )
  app.run
end