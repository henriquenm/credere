# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe 'GET new_import' do
    it 'render new_import template' do
      get :new_import
      expect(response).to render_template('new_import')
    end
  end

  describe 'POST import' do
    it 'redirect_to store_path' do
      post :import
      expect(response).to redirect_to('/stores')
    end
  end
end
