require 'items'
require 'pg'

RSpec.describe ItemRepo do
  def reset_items_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'shop-manager' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_items_table
  end

  it 'lists all items in the table' do
    item_repo = ItemRepo.new

    items = item_repo.all

    expect(items[0].id).to eq '1'
    expect(items[0].name).to eq 'soap'
    expect(items[0].unit_price).to eq '2'
    expect(items[0].quantity).to eq '250'

    expect(items[3].id).to eq '4'
    expect(items[3].name).to eq 'pasta'
    expect(items[3].unit_price).to eq '1'
    expect(items[3].quantity).to eq '500'
  end

  it 'creates an entry in the items table' do
    item_repo = ItemRepo.new

    item_repo.create('gel', 2, 100)

    expect(item_repo.all.length).to eq 6
  end  
end    

