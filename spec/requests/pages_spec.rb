require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response).to_not render_template(:about)
      expect(response).to_not render_template(:contact)
      expect(response).to_not render_template(:boutique)
    end
  end

  describe 'GET /about' do
    it 'returns http success' do
      get '/about'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:about)
      expect(response).to_not render_template(:index)
      expect(response).to_not render_template(:contact)
      expect(response).to_not render_template(:boutique)
    end
  end

  describe 'GET /contact' do
    it 'returns http success' do
      get '/contact'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:contact)
      expect(response).to_not render_template(:about)
      expect(response).to_not render_template(:index)
      expect(response).to_not render_template(:boutique)
    end
  end

  describe 'GET /boutique' do
    it 'returns http success' do
      get '/boutique'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:boutique)
      expect(response).to_not render_template(:about)
      expect(response).to_not render_template(:index)
      expect(response).to_not render_template(:contact)
    end
  end
end
