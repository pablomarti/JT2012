class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.references :country
      t.string :mobile
      t.text :comment

      t.timestamps
    end
    add_index :contacts, :country_id
  end
end
