class CreateFreelancers < ActiveRecord::Migration
  def change
    create_table :freelancers do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: true
      t.text :message, null: true

      t.timestamps null: false
    end
  end
end
