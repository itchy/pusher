class TopicsController < ApplicationController
  
  def hello_world
    Pusher['my-channel'].trigger('my-event', {:message => 'hello world'})
    render :text => "Hello Pusher"
  end
  
  def create
    topic = Topic.new(params[:topic])
    topic.save
    respond_to do |format|
      format.html { redirect_to topic.chat }
      format.js { render :text => "This is what you get with js"}
    end
  end
end
