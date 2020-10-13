# frozen_string_literal: true

class Api::V1::TransactionsController < ActionController::API

  def import
    CnabReader.new(params[:import_file]).process_file

    render json: { stores: Store.all }.to_json, status: :ok
  end
end
