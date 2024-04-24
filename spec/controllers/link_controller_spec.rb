require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) { { link: { store_url: 'http://www.testingmcafeesites.com/index.html' } } }

      it 'creates a new tracking link' do
        expect {
          post :create, params: valid_params
        }.to change(Link, :count).by(1)
      end

      it 'returns a random tracking code' do
        post :create, params: valid_params
        expect(JSON.parse(response.body)['tracking_code']).to be_present
      end

      it 'returns a 201 status code' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { link: { store_urls: nil } } }
      
      it 'does not create a new tracking link' do
        expect {
          post :create, params: invalid_params
        }.to_not change(Link, :count)
      end

      it 'returns an unprocessable entity status code' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #show' do
    let(:link) { build(:link) }

    it 'returns the tracking link details' do
      get :show, params: { tracking_code: link.tracking_code }
      expect(JSON.parse(response.body)['id']).to eq(link.id)
    end

    it 'returns a not found status code if tracking code does not exist' do
      get :redirect, params: { tracking_code: 'invalid_tracking_code' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'GET #redirect' do
    let(:link) { create(:link, store_url: 'http://www.testingmcafeesites.com/index.html') }

    it 'increments the visit count' do
      expect {
        get :redirect, params: { tracking_code: link.tracking_code }
      }.to change { link.reload.visit }.by(1)
    end

    it 'redirects to the store URL' do
      get :redirect, params: { tracking_code: link.tracking_code }
      expect(response).to redirect_to(link.store_url)
    end

    it 'returns a not found status code if tracking code is invalid' do
      get :redirect, params: { tracking_code: 'invalid_tracking_code' }
      expect(response).to have_http_status(:not_found)
    end
  end
end
