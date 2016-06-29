Gem::Specification.new do |s|
	s.name        	= 'hola_ender'
	s.version     	= '0.1.0'
	s.date        	= '2016-06-29'
	s.summary     	= "Hola Ender!"
	s.description 	= "A simple hello world gem to test ruby gems"
	s.authors     	= ["David Anuta"]
	s.email       	= 'qwertydraw@gmail.com'

	s.post_install_message = "I don't know why you just installed something I'm using for testing... Thanks?"

	s.add_development_dependency "minitest"

	s.files       	= ["lib/hola_ender.rb", "lib/hola_ender/translator.rb", "test/test_hola_ender.rb"]
	s.homepage    	= 'http://rubygems.org/gems/hola_ender'
	s.license		= 'MIT'
end