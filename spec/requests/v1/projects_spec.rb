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
      get "/api/v1/projects/new", params: { project: {ext_id: "4059"} }
    end

    it 'returns status as ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns the json for project' do
      expect(json_response[:author]).to eq("Governo - Governador")
      expect(json_response[:kind]).to eq("Projeto de Lei")
      expect(json_response[:number]).to eq("201")
      expect(json_response[:year]).to eq("2013")
      expect(json_response[:status]).to eq("Aprovado")
      expect(json_response[:description]).to eq("DISPÕE SOBRE A DOAÇÃO E A VENDA DE ÁREAS DE DOMÍNIO DA ADMINISTRAÇÃO PÚBLICA DIRETA E INDIRETA, PARA EFEITO DE REGULARIZAÇÃO FUNDIÁRIA DE INTERESSE SOCIAL.")
      expect(json_response[:steps].size).to eq 2
      expect(json_response[:link]).to eq "https://sapl.al.ac.leg.br/media/sapl/public/materialegislativa/2013/4059/4059_texto_integral.pdf"
      expect(json_response[:introduction_date]).to eq "17/12/2013"
    end
  end

  describe 'POST /projects' do
  end

  describe 'DELETE /projects/:id' do
  end
end
