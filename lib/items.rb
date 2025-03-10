require_relative 'database_connection'

class Item
    attr_accessor :id, :name, :unit_price, :quantity
end

class ItemRepo
  def all
    DatabaseConnection.connect('shop-manager')
    result = DatabaseConnection.exec_params('SELECT * FROM items;', [])

    items = []

    result.each do |record|
      item = Item.new
      item.id = record['id']
      item.name = record['name']
      item.unit_price = record['unit_price']
      item.quantity = record['quantity']
      
      items << item
    end

    return items

    
  end
  
  def create(name, unit_price, quantity)
    DatabaseConnection.connect('shop-manager')
    sql = 'INSERT INTO items (name, unit_price, quantity) VALUES ($1, $2, $3);'
    
    params = [name, unit_price, quantity]
    
    DatabaseConnection.exec_params(sql, params)
  end  
end