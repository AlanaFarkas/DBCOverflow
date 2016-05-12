get '/sessions/new' do
  redirect '/login'
end

# new session route
get '/login' do
  erb :'sessions/login'
end

#Create session route
post '/login' do
 user = User.find_by(username: params[:user][:username])

  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = ["Wrong username or password"]
    erb :'sessions/login'
  end
end

# post '/login' do
#   user = User.authenticate(params[:username], params[:password])
#   if user
#     session[:user_id] = user.id
#     redirect '/index'
#   else
#     @errors = user.errors.full_messages
#     erb :'sessions/login'
#   end
# end

# delete session route
get '/logout' do
  session.clear
  redirect '/'
end
