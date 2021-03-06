class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, index: { unique: true }
      t.string :token, index: { unique: true }

      t.timestamps
    end
  end
end
