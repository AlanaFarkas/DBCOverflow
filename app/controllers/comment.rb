#See all comments
get '/comments' do
  erb :'_comments'
end

#Create new comment
get '/comments/new' do
  erb :'comments/new'
end

post '/comments' do
  @comment = Comment.new(params[:comment])

  if @comment.save
    redirect '/questions'
  else
    @errors = @comment.errors.full_messages
    erb :'comments/new'
  end
end

#Edit comment
get '/comments/:id/edit' do
  @comment = Comment.find(params[:comment])
  erb :'comments/edit'
end

put '/comments/:id'
  @comment = Comment.find(params[:comment])
  @comment.assign_attributes(params[:comment])
  if @comment.save
    redirect '/comments'
  else
    erb :'comments/edit'
  end
end

#Delete comment
delete '/comments/:id'
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect '/comments'
end

