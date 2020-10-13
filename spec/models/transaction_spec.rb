# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject { described_class.new(date_and_time: DateTime.now,
                                value: 123.45,
                                card: '1234****6678',
                                cpf: '556.418.150-63',
                                transaction_type: TransactionType.new,
                                store: Store.new
                              )
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a date_and_time' do
    subject.date_and_time = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a value' do
    subject.value = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a card' do
    subject.card = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a cpf' do
    subject.cpf = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a transaction_type' do
    subject.transaction_type = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a store' do
    subject.store = nil
    expect(subject).to_not be_valid
  end
end
