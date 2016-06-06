class Tunr < Sinatra::Base
  include AnimalHelper
  # General route actions
  get '/' do
    p "what does the fox say?", fox # from AnimalHelper
    erb :home
  end

  get '/about' do
    erb :about
  end

end
