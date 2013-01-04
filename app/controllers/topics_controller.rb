class TopicsController < ApplicationController
  
  def hello_world
    Pusher['my-channel'].trigger('my-event', {:message => 'hello world'})
    render :text => "Hello Pusher"
  end
  
  def create
    topic = Topic.new(params[:topic])
    @chat = Chat.find(topic.chat_id)
    topic.save
    @topics = @chat.topics
    respond_to do |format|
      format.html { render  'chats/show' }
      format.js { 
        content = render_to_string :partial => 'topics/bin', :locals => { :topics => @topics }
        Pusher["chat-#{@chat.id}"].trigger('update-bin', {:message => 'hello world', :html=> content })
        # render :text => "notified pusher"
      }
    end
  end
end
