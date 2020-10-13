# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'display_currency method' do
    it 'should convert number to currency brazilian real' do
      expect(helper.display_currency(1234.56)).to eq("R$1.234,56")
    end
  end
end
