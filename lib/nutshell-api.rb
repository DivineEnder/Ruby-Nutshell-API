require "rubygems"

require "net/http"
require "net/https"
require "uri"
require "json"
	
class NutshellAPI

	#Gets the user specific api url and parses it into a uri
	def initialize(username, api_key)
		@username = username
		@api_key = api_key

		@uri = URI.parse("http://api.nutshell.com/v1/json")
		#Calls the getApiForUsername method in Nutshell API with the given username and sets the 'api' section of the result to a variable
		user_api_url = getApiForUsername(@username)['api']

		@uri = URI.parse("https://#{user_api_url}/api/v1/json")
	end

	#Makes actual post request using the json body passed to it
	def http_post_request(req_body)
		#New http request (uri library deals with port and host on its own when parsing the url)
		http = Net::HTTP.new(@uri.host, @uri.port)
		#Original api url get does not need SSL (bad solution but any other way would not seem to work properly)
		if caller[1][/`.*'/].nil? or not (caller[1][/`.*'/][1..-2] == "initialize")
			#Https security stuff (don't need security when getting initial api url)
			http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		end
		#Post request using uri
		request = Net::HTTP::Post.new(@uri.request_uri)
		#Sets request to use basic authentication using the given username and api_key
		request.basic_auth(@username, @api_key)
		#Sets request to use json content type
		request.content_type = "application/json"
		#Sets request body to json file passed
		request.body = req_body
		#Executes setup request and returns body
		http.request(request).body
	end

	#This function turns the call into a method call in the Nutshell API
	#When you call a missing method in the class it comes here passing the name of function that you tried to call and the arguments that you sent that function
	def method_missing(name, *args)

		#Creates a json file with the method that you want to call (name), a custom id for the call (can be anything), and any other parameters passed to the function
		req_body = { :method => name, :params => args, :id => "Northworld Manager" }.to_json
		
		#Executes request
		request = http_post_request(req_body)

		#Checks for an empty request response
		if request.empty?
			puts "Recieved an empty response. There may not have been any items matching your query online."
			nil
		else
			#Parses the json response from the request
			resp = JSON.parse(request)

			#Checks for errors
			if resp['error']
				#Update error
				if resp['error']['code'] == 409
					puts "Rev key out of date. Online changes have been made. Please sync manager with nutshell."
				#Other errors
				else
					puts "Nutshell API Error: " + resp['error']['message'] + " (" + resp['error']['code'].to_s + ")"
				end

				nil
			end

			#Return json response result from the api method call
			resp['result']
		end
	end
end