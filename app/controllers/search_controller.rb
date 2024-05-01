class SearchController < ApplicationController
  protect_from_forgery with: :null_session

  def record_search
    query = params[:query].strip.downcase
    ip_address = request.remote_ip

    if query.blank?
      render json: { status: 'error', message: 'Query parameter is required' }, status: :unprocessable_entity
      return
    end

    # Find the last search log entry for the current IP address
    last_search_log = SearchLog.where(ip_address: ip_address).last

    # Check if there is a previous search log and if the new query is a continuation
    if last_search_log && query.start_with?(last_search_log.query)
      # Update the last search log with the new query
      last_search_log.update(query: query)
      render json: { status: 'success', message: 'Query updated successfully' }
    else
      # Create a new search log entry
      search_log = SearchLog.new(query: query, ip_address: ip_address)
      
      if search_log.save
        render json: { status: 'success', message: 'New query saved successfully' }
      else
        render json: { status: 'error', message: search_log.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  end
end
