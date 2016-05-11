get '/sessions/new' do
  redirect '/login'
end

# new session route
get '/login' do
  erb :'sessions/login'
end

# create session route
post '/login' do
 user = User.find_by(username: params[:user][:username])

  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["Wrong username or password"]
    erb :'sessions/login'
  end
end

# delete session route
get '/logout' do
  session.clear
  redirect '/'
end
