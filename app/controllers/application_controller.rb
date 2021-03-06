require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get('/') {erb :homepage}

  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      if logged_in?
        @user = User.find(session[:user_id])
      end
    end

    def login(user_id)
      session[:user_id] = user_id
    end

    def logout
      session.clear
    end
  end

end