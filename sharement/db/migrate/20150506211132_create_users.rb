class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :username
    	t.string :first_name
    	t.string :last_name
    	t.string :password_digest
    	t.string :address
    	t.string :city
    	t.string :state
    	t.integer :postal_code
    	t.integer :phone_number

    	t.timestamps
    end
  end
end
