# frozen_string_literal: true

class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :owner_name, null: false
      t.decimal :balance, default: 0.0

      t.timestamps null: false
    end
  end
end
