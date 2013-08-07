require 'securerandom'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

create_url = lambda do
  url_creation_logic
end

post '/urls', &create_url
get '/urls', &create_url

get '/invalid_url' do
  erb :invalid_url
end

get '/:short_url' do
  url = Url.where(short_url: params[:short_url]).first
  url.click_count += 1
  url.save
  redirect url.url
end