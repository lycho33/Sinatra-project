class UsersController < ApplicationController
    get '/signup' do
        erb :"users/new"
    end

    post '/signup' do
        redirect_if_logged_in
        user = User.new(params[:user]) 
        if user.save
            session["user_id"] = user.id
            redirect "/home"
        else
            redirect "/signup"
        end
    end

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        redirect_if_logged_in
        user = User.find_by(username: params["user"]["username"])
        if user && user.authenticate(params["user"]["password"])
            session[:user_id] = user.id
            redirect "/home"
        else
            redirect "/login"
        end
    end

    get "/logout" do
        session.clear
        redirect "/"
    end

    get '/home' do
        @user = current_user
        erb :'/users/home'
    end
end