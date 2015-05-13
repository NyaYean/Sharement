class CreateUsersAgreements < ActiveRecord::Migration
  def change
    # create_table :users_agreements do |t|
    # 	t.integer :amount

    	
    # end
    create_join_table :users, :agreements
  end
end
