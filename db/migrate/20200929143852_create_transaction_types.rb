# frozen_string_literal: true

class CreateTransactionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_types do |t|
      t.integer :type_code, null: false
      t.string :description, null: false
      t.string :nature, null: false
      t.string :signal, null: false

      t.timestamps null: false
    end
  end
end
