class AnalyticsController < ApplicationController
  def index
    @ip_addresses = SearchLog.distinct.pluck(:ip_address)
  end

  def queries
    @ip_address = params[:ip_address]
    @search_logs = SearchLog.where(ip_address: @ip_address).group(:query).count.sort_by { |_query, count| -count }
  end
end
