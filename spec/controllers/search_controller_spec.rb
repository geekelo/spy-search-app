# spec/controllers/search_controller_spec.rb
require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'POST #record_search' do
    context 'with valid parameters' do
      let(:valid_params) { { query: 'test query' } }

      it 'creates a new SearchLog record' do
        expect do
          post :record_search, params: valid_params
        end.to change(SearchLog, :count).by(1)
      end

      it 'returns a success status' do
        post :record_search, params: valid_params
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { query: '' } }

      it 'does not create a new SearchLog record' do
        expect do
          post :record_search, params: invalid_params
        end.not_to change(SearchLog, :count)
      end

      it 'returns an error status' do
        post :record_search, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns an error message' do
        post :record_search, params: invalid_params
        expect(JSON.parse(response.body)['status']).to eq('error')
      end
    end
  end
end
