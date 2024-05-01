# app/controllers/search_controller.rb
class SearchController < ApplicationController
  protect_from_forgery with: :null_session

  def record_search
    query = params[:query]
    ip_address = request.remote_ip

    # Ensure that the query parameter is present
    if query.blank?
      render json: { status: 'error', message: 'Query parameter is required' }, status: :unprocessable_entity
      return
    end

    # Create a new SearchLog record with the query and IP address
    search_log = SearchLog.new(query: query, ip_address: ip_address)

    if search_log.save
      render json: { status: 'success' }
    else
      render json: { status: 'error', message: search_log.errors.full_messages.join(', ') }, status: :unprocessable_entity
    end
  end
end
