require_relative 'config/environment'
require_relative 'models/piglatinizer.rb'

class App < Sinatra::Base
  get '/' do
    erb :user_input
  end

  get '/piglatinize' do
    raise params
    erb :piglatinize
  end

  post '/piglatinize' do
    text_from_user = params[:user_phrase]
    @analyzed_text = PigLatinizer.new.piglatinize(text_from_user)
    redirect_to '/piglatinize'
  end

end
