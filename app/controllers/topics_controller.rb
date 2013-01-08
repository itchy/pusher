class TopicsController < ApplicationController
  
  def hello_world
    Pusher['my-channel'].trigger('my-event', {:message => 'hello world'})
    render :text => "Hello Pusher"
  end
  
  def discuss
    @topic = Topic.find(params[:id])
    @chat = @topic.chat
    @topic.activate
    @unaddressed_topics = @chat.topics.unaddressed
    @addressed_topics = @chat.topics.addressed
    
    respond_to do |format|
      format.html { render  'chats/show' }
      format.js { 
        content = render_to_string :partial => 'topics/bin', :locals => { :topics => @unaddressed_topics }
        Pusher["chat-#{@chat.id}"].trigger('update-bin', {:message => 'hello world', :html=> content })


        content = render_to_string :partial => 'topics/active', :locals => { :topic => @topic }        
        Pusher["chat-#{@chat.id}"].trigger('update-active', {:message => 'hello world', :html=> content })
        content = render_to_string :partial => 'posts/form', :locals => { :topic => @topic }        
        Pusher["chat-#{@chat.id}"].trigger('update-post-form', {:message => 'hello world', :html=> content })
        form = content
        
        
        content = render_to_string :partial => 'topics/addressed', :locals => { :topics => @addressed_topics }        
        Pusher["chat-#{@chat.id}"].trigger('update-addressed', {:message => 'hello world', :html=> content })

        render :text => form # "content pushed through pusher"
      }
    end
  end
  
  def create
    topic = Topic.new(params[:topic])
    @chat = Chat.find(topic.chat_id)
    topic.save
    @topics = @chat.topics.unaddressed
    # set new to true for this topic while it is in memory
    @topics.map { |t| t.new = true if t.id == topic.id }
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
