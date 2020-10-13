# frozen_string_literal: true

class Transaction < ActiveRecord::Base
  belongs_to :store
  belongs_to :transaction_type

  validates_presence_of :date_and_time, :value, :card, :cpf
end
