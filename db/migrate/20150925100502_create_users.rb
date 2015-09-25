class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :role, default: :member
    	t.string :fname
    	t.string :lname
    	t.string :image
    end
  end
end
