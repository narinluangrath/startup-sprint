describe 'App' do

  describe 'GET /' do

    it 'returns a 200 status code' do
      get '/'
      expect(last_response.status).to eq(200)
    end
    it 'loads the home.erb file' do
      get '/'
      expect(last_response.body).to include("Startup Sprint!!")
    end
  end
