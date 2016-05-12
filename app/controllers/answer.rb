post '/answers' do
  @answer = Answer.new(body: params[:body], user_id: current_user.id, question_id: params[:question_id])
  if request.xhr?
    @answer.save
    erb :'/answers/_answers', layout: false, locals: {answer: @answer}
  else
    @answer.save
    redirect "/questions/#{params[:question_id]}"
  end
  @answer_errors = @answer.errors.full_messages
  redirect "/questions/#{params[:question_id]}"
end

post '/answers/:id/upvote' do
  answer = Answer.find_by(id: params[:id])
  if answer.votes.where(vote_value: 1, user_id: current_user.id).length == answer.votes.where(vote_value: -1, user_id: current_user.id).length
    answer.votes.create(vote_value: 1, user_id: current_user.id)
    redirect "/questions/#{answer.question.id}"
  elsif answer.votes.where(vote_value: 1, user_id: current_user.id).length < answer.votes.where(vote_value: -1, user_id: current_user.id).length
    answer.votes.create(vote_value: 1, user_id: current_user.id)
    redirect "/questions/#{answer.question.id}"
  elsif answer.votes.find_by(vote_value: 1, user_id: current_user.id)
    redirect "/questions/#{answer.question.id}"
  else
    answer.votes.create(vote_value: 1, user_id: current_user.id)
    redirect "/questions/#{answer.question.id}"
  end
end

post '/answers/:id/downvote' do
  answer = Answer.find_by(id: params[:id])
  if answer.votes.where(vote_value: 1, user_id: current_user.id).length == answer.votes.where(vote_value: -1, user_id: current_user.id).length
    redirect "/questions/#{answer.question.id}"
  elsif answer.votes.where(vote_value: 1, user_id: current_user.id).length < answer.votes.where(vote_value: -1, user_id: current_user.id).length
    redirect "/questions/#{answer.question.id}"
  elsif answer.votes.where(vote_value: 1, user_id: current_user.id).length > answer.votes.where(vote_value: -1, user_id: current_user.id).length
    answer.votes.create(vote_value: -1, user_id: current_user.id)
    redirect "/questions/#{answer.question.id}"
  else
    answer.votes.create(vote_value: -1, user_id: current_user.id)
    redirect "/questions/#{answer.question.id}"
  end
end

get '/answers/:id/edit' do
  @answer = Answer.find_by(id: params[:id])
  erb :'/answers/edit'
end

put '/answers' do
  @answer = Answer.find_by(id: params[:id])
  @answer.assign_attributes(body: params[:body])
  if @answer.save
    redirect '/questions/<%=@answer.question.id%>'
  else
    @answer_update_errors = @answer.errors.full_messages
    erb :'/answers/edit'
  end
end

delete '/answers' do
  # add delete button to the actual post itself on the question show page
end
