require 'rails_helper'

RSpec.describe 'Columns', type: :request do
  let!(:columns) { create_list(:column, 10) }
  let!(:articles) { create_list(:article, 20, column_id: columns.first.id) }

  describe 'GET /columns' do
    before { get '/columns' }

    it 'returns columns' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
