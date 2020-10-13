# frozen_string_literal: true

namespace :populate do
  task transaction_type: :environment do
    print_with_timestamp 'Starting process'

    transaction_types = [
      { type_code: 1, description: 'Débito', nature: 'Entrada', signal: '+' },
      { type_code: 2, description: 'Boleto', nature: 'Saída', signal: '-' },
      { type_code: 3, description: 'Financiamento', nature: 'Saída', signal: '-' },
      { type_code: 4, description: 'Crédito', nature: 'Entrada', signal: '+' },
      { type_code: 5, description: 'Recebimento Empréstimo', nature: 'Entrada', signal: '+' },
      { type_code: 6, description: 'Vendas', nature: 'Entrada', signal: '+' },
      { type_code: 7, description: 'Recebimento TED', nature: 'Entrada', signal: '+' },
      { type_code: 8, description: 'Recebimento DOC', nature: 'Entrada', signal: '+' },
      { type_code: 9, description: 'Aluguel', nature: 'Saída', signal: '-' }
    ]

    transaction_types.each do |tt|
      transaction_type = TransactionType.new(tt)
      print_with_timestamp "Saving transaction type: #{transaction_type.description}"
      transaction_type.save!
      print_with_timestamp 'Successfully saved'
    end

    print_with_timestamp 'Ending process'
  end

  def self.print_with_timestamp(msg)
    puts "[#{Time.zone.now.strftime('%Y-%m-%d %H:%M:%S')}] #{msg}"
  end
end
