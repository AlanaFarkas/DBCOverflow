get '/questions' do
  erb :'/index'
end

get '/questions/new' do

  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(title: params[:title], body: params[:body], user_id: current_user.id)
  tags = params[:tags].split(", ")

  if @question.save
    tags.each do |tag|
      old_tag = Tag.find_by(name: tag)
      if old_tag
        @question.tags << old_tag
      else
        new_tag = Tag.create(name: tag)
        @questions << new_tag
      end
    end
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'/questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])

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
