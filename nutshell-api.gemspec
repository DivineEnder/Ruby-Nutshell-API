Gem::Specification.new do |s|
	s.name        	= 'nutshell-api'
	s.version     	= '0.0.0'
	s.date        	= '2016-06-29'
	s.summary     	= "Ruby integration of the Nutshell API. Does not have a dependency on Httparty which does not support versions of ruby before 1.9.3"
	s.description 	= "Simple Nutshell CRM API integration. Different from already existing versions in that it is no built off of httparty. Since httparty only seems to support ruby versions greater than 1.9.3 this gem is an alternative for those that are using older versions of ruby."
	s.authors     	= ["David Anuta"]
	s.email       	= 'qwertydraw@gmail.com'

	s.post_install_message = "Thanks for install!"

	# s.add_runtime_dependency "net/http"
	# s.add_runtime_dependency "net/https"
	# s.add_runtime_dependency "uri"
	s.add_runtime_dependency "json"

	s.add_development_dependency "minitest"
	# s.add_development_dependency "net/http"
	# s.add_development_dependency "net/https"
	# s.add_development_dependency "uri"
	s.add_development_dependency "json"

	s.files       	= ["lib/nutshell-api.rb", "test/test.rb"]
	s.homepage    	= 'https://github.com/DivineEnder/Ruby-Nutshell-API'
	s.license		= 'MIT'
end