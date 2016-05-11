#User controller

#See all users
get '/users' do
  @users = User.all
  erb :'users/index'
end

#Create new user
get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

#View user profile
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

#Edit a user
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

put '/users/:id' do
  @user = User.find(params[:id])
  @user.assign_attributes(params[:user])

  if @user.save
    redirect '/'
  else
    erb :'users/edit'
  end
end

delete '/users/:id' do
  @user = User.find(params[:id])
  @user.destroy
  redirect '/'
end
