# app/controllers/search_controller.rb

# Define the SearchController class, which inherits from ApplicationController.
class SearchController < ApplicationController
  # Protect from CSRF attacks by using a null session strategy.
  protect_from_forgery with: :null_session

  # Define the action to record search queries.
  def record_search
    # Retrieve the query parameter and the IP address from the request.
    query = params[:query]
    ip_address = request.remote_ip

    # Ensure that the query parameter is present.
    if query.blank?
      # Return a JSON response with an error message if the query parameter is missing.
      render json: { status: 'error', message: 'Query parameter is required' }, status: :unprocessable_entity
      return
    end

    # Create a new SearchLog record with the query and IP address.
    search_log = SearchLog.new(query: query, ip_address: ip_address)

    # Attempt to save the search log record.
    if search_log.save
      # Return a JSON response with a success status if the record is saved successfully.
      render json: { status: 'success' }
    else
      # Return a JSON response with an error status and message if saving fails.
      render json: { status: 'error', message: search_log.errors.full_messages.join(', ') },
             status: :unprocessable_entity
    end
  end
end
