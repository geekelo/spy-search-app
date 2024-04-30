class AnalyticsController < ApplicationController
  def index
    @ip_addresses = SearchLog.distinct.pluck(:ip_address)
    @total_ip_addresses = @ip_addresses.count
    @queries = SearchLog.distinct.pluck(:query)
    @total_queries = @queries.count
  end

  # performs the initial query to retrieve the search logs matching the specified IP address.
  # sorts the search logs by count in descending order.
  # uses manual implementaion on in_batches to batch the sorted search logs as inbatch do not work on arrays.
  # the in_batches method is not applicable to an array like @search_logs because it's a method provided by ActiveRecord for querying records in batches directly from the database.
  # iterates over each batch and combine the search logs into a single hash (combined_search_logs).
  # sorts the combined search logs by count in descending order again.
  def queries
    @ip_address = params[:ip_address]
    search_logs_hash = SearchLog.where(ip_address: @ip_address).group(:query).count
  
    # Convert search logs to an array of [query, count] pairs and sort it
    @search_logs = search_logs_hash.sort_by { |_query, count| -count }
  
    batch_size = 1000 # Adjust batch size as needed
    num_batches = (@search_logs.length / batch_size.to_f).ceil
  
    combined_search_logs = {}
  
    # Process each batch
    (0...num_batches).each do |batch_index|
      start_index = batch_index * batch_size
      end_index = [start_index + batch_size - 1, @search_logs.length - 1].min
  
      batch = @search_logs[start_index..end_index]
  
      batch.each do |query, count|
        # Add or update the count for each query in the combined search logs
        combined_search_logs[query] ||= 0
        combined_search_logs[query] += count
      end
    end
  
    # Sort the combined search logs by count in descending order
    @search_logs = combined_search_logs.sort_by { |_query, count| -count }
  end
end
