# frozen_string_literal: true

class Api::V1::StoresController < ActionController::API

  def index
    stores = Store.all

    render json: { stores: stores }.to_json, status: :ok
  end

  def show
    store = Store.find(params[:id]) if params[:id]
    transactions = store.transactions.order(date_and_time: :desc)

    render json: { stores: store, transactions: transactions }.to_json, status: :ok
  end
end
