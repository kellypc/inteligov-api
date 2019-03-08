require 'rails_helper'

RSpec.describe 'Projects API' do

  describe 'GET /projects' do
    let!(:project) { FactoryBot.create(:project) }

    before do
      get '/api/v1/projects', params: {}
    end

    it 'returns status as ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns 1 project from database' do
      expect(json_response.count).to eq 1
    end
  end

  describe 'GET /new' do
    before do
      get "/api/v1/projects/new", params: { project: {ext_id: "12345"} }
    end

    it 'returns status as ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the json for project' do
      expect(json_response[:author]).to eq("Nome Author")
    end
  end

  describe 'POST /projects' do
  end

  describe 'DELETE /projects/:id' do
  end
end
