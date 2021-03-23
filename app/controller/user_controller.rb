class UserController < ApplicationController
    get '/signup' do
        erb :"users/new"
    end

    post '/signup' do
        redirect_if_logged_in
        @user = User.new(username: params[:username],email: params[:email], password: params[:password])
        if user.save
            session["user_id"] = user.id
            redirect "/login"
        else
            redirect "/signup"
        end
    end

    get '/login' do
        erb :'sessions/login'
    end

    post '/login' do
        redirect_if_logged_in
        user = User.find_by(email: params["user"]["email"])
        if user && user.authenticate(params["user"]["password"])
            session["user_id"] = user.id
            redirect "/movies"
        else
            redirect "/login"
        end
    end
end