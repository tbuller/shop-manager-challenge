require_relative 'database_connection'

class Order
    attr_accessor :id, :customer_name, :order_date, :item_id
end

class OrderRepo
  def all
    DatabaseConnection.connect('shop-manager')
    result = DatabaseConnection.exec_params('SELECT * FROM orders', [])

    orders = []

    result.each do |record|
      order = Order.new
      order.id = record['id']
      order.customer_name = record['customer_name']
      order.order_date = record['order_date']
      order.item_id = record['item_id']

      orders << order
    end
    
    return orders
    
  end  
end