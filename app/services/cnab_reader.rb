# frozen_string_literal: true

class CnabReader
  def initialize(cnab_file)
    @cnab = cnab_file
  end

  def process_file
    if @cnab.present?
      File.open(@cnab).each do |line|
        parse_line(line)
      end
    end
  end

  def parse_line(line)
    transaction_type = find_transaction_type(line.slice(0))
    date_and_time = formatted_datetime(line.slice(1..8), line.slice(42..47))
    value = formatted_value(line.slice(9..18))
    cpf = formatted_cpf(line.slice(19..29))
    card = line.slice(30..41)
    store_owner = line.slice(48..61).strip
    store_name = line.slice(62..80).strip.gsub('\n', '')

    store_params = {
      name: store_name,
      owner_name: store_owner
    }
    store = create_store(store_params)
    update_store_balance(store, value, transaction_type.signal)

    transaction_params = {
      store_id: store.id,
      transaction_type_id: transaction_type.id,
      date_and_time: date_and_time,
      value: value,
      card: card,
      cpf: cpf
    }
    create_transaction(transaction_params)
  end

  def find_transaction_type(code)
    TransactionType.find_by(type_code: code)
  end

  def formatted_datetime(date, time)
    DateTime.parse(date + time).strftime('%d/%m/%Y %H:%M:%S')
  end

  def formatted_value(value)
    value.to_f / 100
  end

  def formatted_cpf(cpf)
    "#{cpf[0, 3]}.#{cpf[3, 3]}.#{cpf[6, 3]}-#{cpf[9, 2]}"
  end

  def create_store(params)
    Store.find_or_create_by!(params)
  end

  def update_store_balance(store, value, signal)
    value = "#{signal}#{value}".to_f
    store.balance = store.balance + value
    store.save
  end

  def create_transaction(params)
    Transaction.create!(params)
  end
end
