# spec/routing/routes_spec.rb

require 'rails_helper'

RSpec.describe "Routes", type: :routing do
  describe "AnalyticsController routes" do
    it "routes GET /analytics/index to the analytics#index action" do
      expect(get: "/analytics/index").to route_to("analytics#index")
    end

    it "routes GET /analytics/queries to the analytics#queries action" do
      expect(get: "/analytics/queries").to route_to("analytics#queries")
    end
  end

  describe "SearchController routes" do
    it "routes POST /search/record_search to the search#record_search action" do
      expect(post: "/search/record_search").to route_to("search#record_search")
    end

    it "routes GET /search/index to the search#index action" do
      expect(get: "/search/index").to route_to("search#index")
    end
  end

  describe "Health check route" do
    it "routes GET /up to the rails/health#show action" do
      expect(get: "/up").to route_to("rails/health#show")
    end
  end

  describe "Root route" do
    it "routes the root path to the search#index action" do
      expect(get: "/").to route_to("search#index")
    end
  end

  describe "Custom analytics route" do
    it "routes GET /analytics to the analytics#index action" do
      expect(get: "/analytics").to route_to("analytics#index")
    end

    it "routes GET /analytics/queries to the analytics#queries action" do
      expect(get: "/analytics/queries").to route_to("analytics#queries")
    end
  end
end
