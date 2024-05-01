# spec/views/layouts/application.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'layouts/application', type: :view do
  context 'when rendering the layout' do
    it 'includes the back' do
      render
      expect(rendered).to include('#60; Back')
      # Verifying if the layout includes a button with id 'backButton', class 'nav-links', and text '&#60; Back'
    end

    it 'displays the Home' do
      render
      expect(rendered).to include('Home')
      # Assuming the Home link is an anchor tag with href attribute '/'
    end

    it 'displays the Analytics' do
      render
      expect(rendered).to include('Analytics')
      # Assuming the Home link is an anchor tag with href attribute '/'
    end

    it 'renders the navbar section' do
      render
      expect(rendered).to include('navbar')
      # Assuming there is a partial or section named 'navbar' included in the layout
    end

    it 'renders the footer section' do
      render
      expect(rendered).to include('footer')
      # Assuming there is a partial or section named 'footer' included in the layout
    end
  end
end
