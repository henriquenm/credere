# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.datetime :date_and_time, null: false
      t.decimal :value, null: false
      t.string :card, null: false
      t.string :cpf, null: false

      t.references :store, null: false
      t.references :transaction_type, null: false

      t.timestamps null: false
    end
  end
end
