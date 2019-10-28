class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.integer :age
      t.string :city
    end
  end
end
