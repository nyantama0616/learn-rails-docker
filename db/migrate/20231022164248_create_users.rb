class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_id, unique: true
      t.string :password

      t.timestamps
    end
  end
end
