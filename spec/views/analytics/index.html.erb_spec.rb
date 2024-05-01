# spec/views/analytics/index.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'analytics/index', type: :view do
  before(:each) do
    assign(:total_ip_addresses, 5)
    assign(:total_queries, 10)
    assign(:ip_addresses, ['192.168.1.1', '192.168.1.2', '192.168.1.3'])
    render
  end

  it 'displays the total number of IP addresses' do
    expect(rendered).to include('Total IP Addresses:')
    expect(rendered).to include('5')
  end

  it 'displays the total number of queries' do
    expect(rendered).to include('Total Queries:')
    expect(rendered).to include('10')
  end

  it 'displays each IP address with a link to see queries' do
    expect(rendered).to include('All IP Addresses')
    expect(rendered).to include('ID')
    expect(rendered).to include('IP ADDRESS')

    expect(rendered).to include('192.168.1.1')
    expect(rendered).to include('/analytics/queries?ip_address=192.168.1.1')
    expect(rendered).to include('See queries⬀')
  end
end
