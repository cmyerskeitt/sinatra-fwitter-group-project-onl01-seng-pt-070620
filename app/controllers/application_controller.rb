require './config/environment'

class ApplicationController < Sinatra::Base

  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
<<<<<<< HEAD
    set :sessions_secret, "secret"
=======
    set :session_secret, "password_security"
  end

  get '/' do
    erb :home
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def authentication_required
      if !logged_in?
        flash[:notice] = "You must be logged in."
        redirect '/'
      end
    end
>>>>>>> 18c0b426ab2fec0fae532bc5095ea1ac27a8c350
  end

  get "/" do
    erb :home
  end 



  helpers do 

    def logged_in?
      !!current_user
    end 

    def current_user
      User.find_by(id: session[:user_id])
    end 

    def authentication_required
      if !logged_in?
        flash[:message] = "You must be logged in."
        redirect '/'
      end
    end
  end
  
end 