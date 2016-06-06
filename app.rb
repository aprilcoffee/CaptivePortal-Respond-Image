require 'byebug'
require 'webshot'
require 'sinatra'
require 'dir'
set :bind, '0.0.0.0'

get '/' do 
  gen_file(request.url,request.user_agent)
  #send_file "shots/google_w.png"
end

get '/*' do
  send_file "shots/tnua_login_w.png"
end

get '/MQS/businfo2.jsp' do
  send_file "shots/tnua_login_w.png"
end

error Exception do
 send_file "shots/tnua_login_w.png"
end 

def gen_file(str,ua)
  t = Time.now
  ws = Webshot::Screenshot.instance
  flag = ua.include?("Mobile")
  print flag
  puts ua

 	if flag
		ws.capture str, "shots/#{t}.png", width: 640, height:960, quality: 50, timeout: 2
  	else 
	        ws.capture str, "shots/#{t}.png", width: 800, height: 600, quality: 50, timeout: 2
	end
        send_file "shots/#{t}.png"
#  erb :index, :locals => {:t => t}
end

