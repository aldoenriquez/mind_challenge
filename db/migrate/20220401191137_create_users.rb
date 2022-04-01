class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.belongs_to :account
      t.string :name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :password_confirmation, null: false
      t.string :english_level
      t.text :tecnic_knowledge
      t.string :cv_link
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
