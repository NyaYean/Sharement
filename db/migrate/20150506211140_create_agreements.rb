class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|

    	t.string :name
    	t.string :description
    	t.string :start_date
    	t.string :agreement_details
    	t.string :payer

    	t.timestamps
    end
  end
end
