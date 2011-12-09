class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :about
      t.string :subdomain
      t.boolean :public, :default => true
      t.integer :category_id
      t.integer :admin_id

      t.timestamps
    end
  end
end
