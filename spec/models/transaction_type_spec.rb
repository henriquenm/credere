# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionType, type: :model do
  subject { described_class.new(type_code: 1,
                                description: 'Débito',
                                nature: 'Entrada',
                                signal: '+'
                              )
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a type_code' do
    subject.type_code = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a nature' do
    subject.nature = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a signal' do
    subject.signal = nil
    expect(subject).to_not be_valid
  end

  it 'has many transactions' do
    should respond_to(:transactions)
  end
end
