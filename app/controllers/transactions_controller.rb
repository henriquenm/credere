# frozen_string_literal: true

class TransactionsController < ApplicationController
  def new_import; end

  def import
    CnabReader.new(params[:import_file]).process_file

    redirect_to stores_path
  end
end
