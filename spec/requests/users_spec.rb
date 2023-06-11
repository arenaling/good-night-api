require 'rails_helper'

RSpec.describe "Testing API -", type: :request do
  describe "Prepare user data -" do
    let(:payload1) do
      {
          username: 'joni',
          fullname: 'Joni Farizal',
      }
    end
    
    let(:payload2) do
      {
        username: 'bagas',
        fullname: 'Bagaskara',
      }
    end
    
    let(:payload3) do
      {
        username: 'ina',
        fullname: 'Illina',
      }
    end
    
    let(:payload4) do
      {
        username: 'endah',
        fullname: 'Endah',
      }
    end
    
    it "Register Joni" do
      expect {
        post '/users', params: payload1.to_json, headers: { 'Content-Type' => 'application/json' }
      }.to change(User, :count).by(1)
      
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("User registered")
    end
    
    it "Register bagas" do
      expect {
        post '/users', params: payload1.to_json, headers: { 'Content-Type' => 'application/json' }
      }.to change(User, :count).by(1)

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("User registered")
    end
    
    it "Register ina" do
      expect {
        post '/users', params: payload3.to_json, headers: { 'Content-Type' => 'application/json' }
      }.to change(User, :count).by(1)
  
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("User registered")
    end
    
    it "Register endah" do
      expect {
        post '/users', params: payload4.to_json, headers: { 'Content-Type' => 'application/json' }
      }.to change(User, :count).by(1)
    
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("User registered")
    end
    
    it "Retrieve all users data" do
      get users_path
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['users'].length).to be > 2
    end
  end
  
  describe "Follow user -" do
    let(:payload1) do
      {
        username: 'bagas',
        follower: 'joni'
      }
    end
    
    let(:payload2) do
      {
        username: 'ina',
        follower: 'joni'
      }
    end
      
    it "Joni follow Bagas" do
      expect {
        post '/users/follow', params: payload1.to_json, headers: { 'Content-Type' => 'application/json' }
      }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("Bagaskara followed")
    end
    
    it "Joni follow Ina" do
      expect {
        post '/users/follow', params: payload2.to_json, headers: { 'Content-Type' => 'application/json' }
      }
  
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("Illina followed")
    end
  end
  
  describe "Clock in -" do
    let(:payload1) do
      {
        username: 'bagas'
      }
    end
  
    let(:payload2) do
      {
        username: 'ina'
      }
    end
    
    let(:payload3) do
      {
        username: 'endah'
      }
    end
  
    it "Bagas sleep" do
      expect {
        post '/activities/sleep', params: payload1.to_json, headers: { 'Content-Type' => 'application/json' }
      }
      
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("Bagaskara sleep")
    end
    
    it "Bagas wake up" do
      expect {
        post '/activities/wake', params: payload1.to_json, headers: { 'Content-Type' => 'application/json' }
      }
  
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("Bagaskara wake up")
    end
  
    it "Ina sleep" do
      expect {
        post '/activities/sleep', params: payload2.to_json, headers: { 'Content-Type' => 'application/json' }
      }
      
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("Illina sleep")
    end
    
    it "Ina wake up" do
      expect {
        post '/activities/wake', params: payload2.to_json, headers: { 'Content-Type' => 'application/json' }
      }
  
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("Illina wake up")
    end
    
    it "Endah sleep" do
      expect {
        post '/activities/sleep', params: payload3.to_json, headers: { 'Content-Type' => 'application/json' }
      }
  
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("Endah sleep")
    end
    
    it "Endah wake up" do
      expect {
        post '/activities/wake', params: payload3.to_json, headers: { 'Content-Type' => 'application/json' }
      }
  
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("Endah wake up")
    end
  end
  
  describe "List user data -" do
    let(:payload) do
      {
        username: 'joni'
      }
    end
    
    it "List all followed data" do
      post '/users/followed_activities', params: payload.to_json, headers: { 'Content-Type' => 'application/json' }
    
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['activities'].length).to be > 0
    end
  end
end
