# spec/controllers/analytics_controller_spec.rb
require 'rails_helper'

RSpec.describe AnalyticsController, type: :controller do
  describe 'GET #index' do
    it 'assigns @ip_addresses and @total_ip_addresses' do
      get :index
      expect(assigns(:ip_addresses)).not_to be_nil
      expect(assigns(:total_ip_addresses)).to eq(SearchLog.distinct.pluck(:ip_address).count)
    end

    it 'assigns @total_queries' do
      get :index
      expect(assigns(:total_queries)).to eq(SearchLog.distinct.pluck(:query).count(0))
    end
  end

  describe 'GET #queries' do
    let(:ip_address) { '127.0.0.1' }

    it 'assigns @total_unique_queries and @total_ip_queries' do
      get :queries, params: { ip_address: ip_address }
      expect(assigns(:total_unique_queries)).not_to be_nil
      expect(assigns(:total_ip_queries)).not_to be_nil
    end

    it 'assigns @search_logs' do
      get :queries, params: { ip_address: ip_address }
      expect(assigns(:search_logs)).not_to be_nil
    end
  end
end
