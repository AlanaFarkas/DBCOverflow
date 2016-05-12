#See all comments
get '/comments' do
  erb :'_comments'
end

#Create new comment
get '/comments/new' do
  erb :'comments/_comments-new'
end

post '/comments/question' do
  # binding.pry
  question = Question.find_by(id: params[:question_id])
  question.comments.build(body: params[:body], user_id: params[:user_id])
  if question.save
    if request.xhr?
      erb :'/comments/_questions-comments', layout: false, locals: {comment: question.comments.last}
    else
      redirect "/questions/#{params[:question_id]}"
    end
  else
    redirect "/questions/#{question.id}"
  end
  # else
  #   @errors = @comment.errors.full_messages
  #   erb :'comments/new'
  # end
end

post '/comments/answer' do
  answer = Answer.find_by(id: params[:answer_id])
  answer.comments.create(body: params[:body], user_id: params[:user_id])
  # if @comment.save
    redirect "/questions/#{answer.question.id}"
  # else
  #   @errors = @comment.errors.full_messages
  #   erb :'comments/new'
  # end
end

#Edit comment
get '/comments/:id/edit' do
  @comment = Comment.find(params[:comment])
  erb :'comments/edit'
end

put '/comments/:id' do
  @comment = Comment.find(params[:comment])
  @comment.assign_attributes(params[:comment])
  if @comment.save
    redirect '/questions'
  else
    erb :'comments/edit'
  end
end

#Delete comment
delete '/comments/:id' do
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect '/questions'
end

