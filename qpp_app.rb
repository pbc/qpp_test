require 'sinatra/base'
require 'erb'

class QppApp < Sinatra::Base
  
  set :erb, :escape_html => true
  enable :static

  get "/" do
    erb :index
  end
end
