class PostsController < ApplicationController
  def create
    post = Post.new(params[:post])
    @topic = Topic.find(post.topic_id)
    post.save
    @posts = @topic.posts
    @chat = @topic.chat
    # set new to true for this topic while it is in memory
    # @topics.map { |t| t.new = true if t.id == topic.id }
    respond_to do |format|
      format.html { render  'chats/show' }
      format.js { 
        content = render_to_string :partial => 'topics/active', :locals => { :topic => @topic }
        Pusher["chat-#{@chat.id}"].trigger('update-active', {:message => 'hello world', :html=> content })
        # render :text => "notified pusher"
      }
    end
  end

end
