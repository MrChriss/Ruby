require 'yaml'

require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'

# Psych == YAML

# before do
#   @users = YAML.load_file("users.yml")
# end
#
# helpers do
#   def count_interests(users)
#     users.reduce(0) do |sum, (name, user)|
#       sum + user[:interests].size
#     end
#   end
# end
#
# get "/" do
#   redirect "/users"
# end
#
# get "/users" do
#   erb :users
# end
#
# get "/:user_name" do
#   @user_name = params[:user_name].to_sym
#   @email = @users[@user_name][:email]
#   @interest = @users[@user_name][:interests]
#
#   erb :user
# end

before do
  @users = YAML.load_file("users.yml")
end

helpers do
  def count_interests(users)
    users.reduce(0) do |sum, (name, user)|
      sum + user[:interests].size
    end
  end
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :users
end

get "/:user_name" do
  @user_name = params[:user_name].to_sym
  @email = @users[@user_name][:email]
  @interests = @users[@user_name][:interests]

  erb :user
end
=begin
"/" --> redirect to "homepage"
list of user names - links to users page

users page:
- display: email address, interests, with comma between each interest
- at the bottom, link to other users

at bottom of every page, display: "There are n users, with m interests."

<-- helper method count_interests, all interests from all users

add new user to yaml file
=end
