class TopicController < ApplicationController
    get '/topic' do
        @topics = Topic.all
        erb :'topics/index'
    end
end