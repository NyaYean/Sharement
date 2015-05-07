class CreateUsersAgreements < ActiveRecord::Migration
  def change
    create_table :users_agreements do |t|
    	t.integer :amount

    	create_join_table :users, :agreements
    end
  end
end
