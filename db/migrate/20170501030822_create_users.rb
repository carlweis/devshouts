class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :role, null: false, default: "user"

      t.timestamps
    end
  end
end
