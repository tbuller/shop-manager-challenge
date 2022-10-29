require 'orders'
require 'pg'

RSpec.describe OrderRepo do
  def reset_orders_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'shop-manager' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_orders_table
  end

  it 'lists all orders in the table' do
    repo = OrderRepo.new

    orders = repo.all

    expect(orders[0].id).to eq '1'
    expect(orders[0].customer_name).to eq 'Tim'
    expect(orders[0].order_date).to eq 'Jan 08'
    expect(orders[0].item_id).to eq '2'

    expect(orders[2].id).to eq '3'
    expect(orders[2].customer_name).to eq 'Amy'
    expect(orders[2].order_date).to eq 'Jan 22'
    expect(orders[2].item_id).to eq '4'
  end  

  it 'creates a new entry in the orders table' do
    repo = OrderRepo.new

    repo.create('Terry', 'June 30', 2)
    repo.create('John', 'June 15', 3)
    repo.create('Gary', 'March 11', 2)
    repo.create('Hannah', 'May 4' , 5)

    expect(repo.all.length).to eq 13
  end  
end  