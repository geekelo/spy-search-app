class AnalyticsController < ApplicationController
  def index
    @ip_addresses = SearchLog.distinct.pluck(:ip_address)
    @total_ip_addresses = @ip_addresses.count
    @queries = SearchLog.distinct.pluck(:query)
    @total_queries = @queries.count  - 1
  end

  # performs the initial query to retrieve the search logs matching the specified IP address.
  # sorts the search logs by count in descending order.
  # uses manual implementaion on in_batches to batch the sorted search logs as inbatch do not work on arrays.
  # the in_batches method is not applicable to an array like @search_logs because it's a method provided by ActiveRecord for querying records in batches directly from the database.
  # iterates over each batch and combine the search logs into a single hash (combined_search_logs).
  # sorts the combined search logs by count in descending order again.
  def queries
    @ip_address = params[:ip_address]

    # Initialize total unique queries and total queries
    @total_unique_queries = 0
    @total_ip_queries = 0

    # Initialize combined search logs hash
    combined_search_logs = {}

    # Batch size for processing search logs
    batch_size = 1000

    # Fetch search logs in batches
    SearchLog.where(ip_address: @ip_address).in_batches(of: batch_size) do |batch|
      batch.each do |log|
        # Update combined search logs hash
        combined_search_logs[log.query] ||= 0
        combined_search_logs[log.query] += 1

        # Update total queries
        @total_ip_queries += 1
      end
    end

    # Calculate total unique queries
    @total_unique_queries = combined_search_logs.keys.length

    # Convert combined search logs hash to an array of [query, count] pairs and sort it
    @search_logs = combined_search_logs.sort_by { |_query, count| -count }
  end
end
