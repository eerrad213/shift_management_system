class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :is_admin
      t.integer :company_id

      t.timestamps
    end
  end
end
