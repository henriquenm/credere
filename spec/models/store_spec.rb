# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  subject { described_class.new(name: 'Loja 1',
                                owner_name: 'João José',
                                balance: -543.21
                              )
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a owner_name' do
    subject.owner_name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a balance' do
    subject.balance = nil
    expect(subject).to_not be_valid
  end

  it 'has many transactions' do
    should respond_to(:transactions)
  end
end
