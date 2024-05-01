# spec/views/search/index.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'search/index', type: :view do
  before(:each) do
    render
  end

  it 'displays the search container' do
    expect(rendered).to include('<div id="search-container">')
  end

  it 'displays the search title' do
    expect(rendered).to include('<h1 id="search-title">Spy Search Engine</h1>')
  end

  it 'displays the search description' do
    expect(rendered).to include('Find your favorite article')
  end

  it 'displays the search input field' do
    expect(rendered).to include('input')
  end

  it 'does not display any form action' do
    expect(rendered).to include('<form action="" method="get">')
  end
end
