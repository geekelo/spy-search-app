# spec/views/analytics/queries.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'analytics/queries', type: :view do
  before(:each) do
    assign(:ip_address, '192.168.1.1')
    assign(:total_unique_queries, 5)
    assign(:total_ip_queries, 10)
    assign(:search_logs, [['query1', 3], ['query2', 5]])
    render
  end

  it 'displays the title with the IP address' do
    expect(rendered).to include('Queries for 192.168.1.1')
  end

  it 'displays the total number of unique queries' do
    expect(rendered).to include('Total unique queries:')
    expect(rendered).to include('5')
  end

  it 'displays the total number of IP queries' do
    expect(rendered).to include('Total Queries:')
    expect(rendered).to include('10')
  end

  it 'displays each query with its count' do
    expect(rendered).to include('ID')
    expect(rendered).to include('QUERY')
    expect(rendered).to include('COUNT')

    expect(rendered).to include('query1')
    expect(rendered).to include('3')

    expect(rendered).to include('query2')
    expect(rendered).to include('5')
  end
end
