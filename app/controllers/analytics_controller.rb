class AnalyticsController < ApplicationController
  def index
    @ip_addresses = SearchLog.distinct.pluck(:ip_address)
  end

  def queries
  end
end
