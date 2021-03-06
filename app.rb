require_relative 'config/environment'

class App < Sinatra::Base
  get '/' do
    @error = params['error']
    erb :home
  end


  get '/home' do
    redirect to('/')
  end

  get '/rainbow' do
      erb :rainbow
    end

  post '/subscribe' do
    @full_name = params[:full_name]
    @email = params[:email]
    @city = params[:city]

    if !@email.match(/.+@.+/)
      redirect to('/?error=email')
    end

    erb :subscribe
  end


  get '/reddit' do
    require 'json'
    require 'rest-client'
    x = JSON.parse(RestClient.get('http://reddit.com/.json'))

    @listings = []
    for i in 0..2
      title = x['data']['children'][i]['data']['title']
      pic = x['data']['children'][i]['data']['preview']['images'][0]['source']['url']
      entry = {'title' => title, 'pic' => pic}
      @listings << entry
    end

    erb :reddit
  end

  get '/team' do
    erb :team
  end

  get '/schedule' do
    @today = [
      ['7:00am', 'Wake up'],
      ['8:00am', 'Work Out'],
      ['9:00am', 'Product Meeting'],
      ['11:00am', 'Ping Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Call it a day'],
    ]

    @tomorrow = [
      ['7:00am', 'Wake up'],
      ['8:00am', 'Work Out'],
      ['9:00am', 'Inbox Zero'],
      ['11:00am', 'Ping Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Meetup Presentation'],
    ]

    @day_after = [
      ['7:00am', 'Wake up'],
      ['8:00am', 'Work Out'],
      ['9:00am', 'Inbox Zero'],
      ['11:00am', 'Ping Pong Break'],
      ['1:00pm', 'Lunch'],
      ['3:00pm', 'Coffee Time'],
      ['6:30pm', 'Meetup Presentation'],
    ]

    erb :schedule
  end
end
