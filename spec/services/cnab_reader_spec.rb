# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CnabReader, type: :service do
  it 'should return transaction type' do
    transaction_type = TransactionType.create!(type_code: 1, description: 'Débito', nature: 'Entrada', signal: '+')
    expect(CnabReader.new("cnab.txt").find_transaction_type(1)).to eq(transaction_type)
  end

  it 'should return formatted datetime' do
    date = "20190301"
    time = "151458"
    formatted_datetime = CnabReader.new("cnab.txt").formatted_datetime(date, time)
    datetime = DateTime.parse(date + time).strftime('%d/%m/%Y %H:%M:%S')
    expect(formatted_datetime).to eq(datetime)
  end

  it 'should return formatted value' do
    formatted_value = CnabReader.new("cnab.txt").formatted_value("0000014200")
    value = 142.0
    expect(formatted_value).to eq(value)
  end

  it 'should return formatted cpf' do
    formatted_cpf = CnabReader.new("cnab.txt").formatted_cpf("43355566690")
    cpf = "433.555.666-90"
    expect(formatted_cpf).to eq(cpf)
  end

  it 'should create store' do
    params = {name: 'Loja 1', owner_name: 'João José', balance: 10}
    store = Store.create!(params)
    create_store = CnabReader.new("cnab.txt").create_store(params)
    expect(store).to eq(create_store)
  end

  it 'should update store balance' do
    store = Store.create!(name: 'Loja 1', owner_name: 'João José', balance: 10)
    value = 300
    signal = "-"
    balance = store.balance + "#{signal}#{value}".to_f
    CnabReader.new("cnab.txt").update_store_balance(store, value, signal)
    expect(balance).to eq(store.balance)
  end

  it 'should create transaction' do
    store = Store.create!(name: 'Loja 1', owner_name: 'João José', balance: 10)
    transaction_type = TransactionType.create!(type_code: 1, description: 'Débito', nature: 'Entrada', signal: '+')
    params = {date_and_time: DateTime.now,
              value: 123.45,
              card: '1234****6678',
              cpf: '556.418.150-63',
              transaction_type: transaction_type,
              store: store
            }

    create_transaction = CnabReader.new("cnab.txt").create_transaction(params)
    expect(true).to be true
  end
end
