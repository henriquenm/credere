# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  describe 'GET index' do
    it "assigns all stores as @stores" do
      store = Store.create(name: 'Loja 1', owner_name: 'João José', balance: -543.21)
      get :index
      assigns(:stores).should eq([store])
    end
  end

  describe 'GET show' do
    it "assigns the requested store as @store" do
      store = Store.create(name: 'Loja 1', owner_name: 'João José', balance: -543.21)
      get :show, params: {id: store.id}
      assigns(:store).should eq(store)
    end
  end
end
