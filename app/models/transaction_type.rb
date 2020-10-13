# frozen_string_literal: true

class TransactionType < ActiveRecord::Base
  has_many :transactions

  validates_presence_of :type_code, :description, :nature, :signal
end
