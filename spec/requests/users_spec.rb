require 'rails_helper'

RSpec.describe "Testing API -", type: :request do
  describe "Test clocked in -" do

    it "Register users" do
      payload1 = {
        username: 'joni',
        fullname: 'Joni Farizal',
      }
      payload2 = {
        username: 'bagas',
        fullname: 'Bagaskara',
      }
      payload3 = {
        username: 'ina',
        fullname: 'Illina',
      }
      payload4 = {
        username: 'endah',
        fullname: 'Endah',
      }
      post '/users', params: payload1.to_json, headers: { 'Content-Type' => 'application/json' }
      
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("User registered")
    
      post '/users', params: payload2.to_json, headers: { 'Content-Type' => 'application/json' }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("User registered")
    
      post '/users', params: payload3.to_json, headers: { 'Content-Type' => 'application/json' }
  
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("User registered")
    
      post '/users', params: payload4.to_json, headers: { 'Content-Type' => 'application/json' }
    
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("User registered")

      get users_path

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['users'].length).to be > 2

      payload1 = {
        username: 'bagas',
        follower: 'joni'
      }
      payload2 = {
        username: 'ina',
        follower: 'joni'
      }

      post '/users/follow', params: payload1.to_json, headers: { 'Content-Type' => 'application/json' }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("bagas followed")
    
      post '/users/follow', params: payload2.to_json, headers: { 'Content-Type' => 'application/json' }
  
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("ina followed")

      payload1 = {
        username: 'bagas'
      }
      payload2 = {
      username: 'ina'
      }
      payload3 = {
      username: 'endah'
      }
      post '/activities/sleep', params: payload1.to_json, headers: { 'Content-Type' => 'application/json' }
      
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("bagas sleep")

      post '/activities/wake', params: payload1.to_json, headers: { 'Content-Type' => 'application/json' }
  
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("bagas wake up")

      post '/activities/sleep', params: payload2.to_json, headers: { 'Content-Type' => 'application/json' }
      
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("ina sleep")

      post '/activities/wake', params: payload2.to_json, headers: { 'Content-Type' => 'application/json' }
  
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("ina wake up")

      post '/activities/sleep', params: payload3.to_json, headers: { 'Content-Type' => 'application/json' }
  
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("endah sleep")

      post '/activities/wake', params: payload3.to_json, headers: { 'Content-Type' => 'application/json' }
  
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq("endah wake up")

      payload = {
        username: 'joni'
      }
      post '/users/list_followed', params: payload.to_json, headers: { 'Content-Type' => 'application/json' }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['list'].length).to be > 0
    end
  end
end
