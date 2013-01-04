class TopicsController < ApplicationController
  def create
    topic = Topic.new(params[:topic])
    topic.save
    redirect_to topic.chat
  end
end
