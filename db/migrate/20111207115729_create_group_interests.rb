class CreateGroupInterests < ActiveRecord::Migration
  def change
    create_table :group_interests do |t|
      t.integer :group_id
      t.integer :interest_id
      t.timestamps
    end
  end
end
