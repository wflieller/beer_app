class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :brewer
      t.string :name, :null => false, :index => true
      t.string :beer_type, :index => true, :null => false
      t.float :abv
    end
  end
end
