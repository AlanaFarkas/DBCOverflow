get '/questions' do
  erb :'/index'
end

get '/questions/new' do

  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(title: params[:title], body: params[:body], user_id: current_user.id)
  tags = params[:tags].split(", ")
  @comments = @question.comments

  if @question.save
    tags.each do |tag|
      old_tag = Tag.find_by(name: tag)
      if old_tag
        @question.tags << old_tag
      else
        new_tag = Tag.create(name: tag)
        @question.tags << new_tag
      end
    end
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'/questions/new'
  end
end

post '/questions/:id/upvote' do
  question = Question.find_by(id: params[:id])
  # binding.pry
  if question.votes.find_by(vote_value: 1, user_id: current_user.id)
    redirect "/questions/#{question.id}"
  else
    question.votes.create(vote_value: 1, user_id: current_user.id)
    redirect "/questions/#{question.id}"
  end
end

post '/questions/:id/downvote' do
  question = Question.find_by(id: params[:id])
  binding.pry
  if question.votes.find_by(vote_value: -1, user_id: current_user.id)
    redirect "/questions/#{question.id}"
  else
    question.votes.create(vote_value: -1, user_id: current_user.id)
    redirect "/questions/#{question.id}"
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @comments = @question.comments

  if logged_in?
    @current_user = current_user
  end
  erb :'/questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/edit'
end

put '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.update_attributes(body: params[:body])

  redirect "/questions/#{@question.id}"
end

delete '/questions/:id' do
  question = Question.find_by(id: params[:id])
  question.destroy
  redirect '/'
end
