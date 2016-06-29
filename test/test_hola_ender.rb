require 'hola_ender'

class HolaEnderTest < Minitest::Unit::TestCase
	def test_english_hello
		assert_equal "hello world",
		HolaEnder.hi("english")
	end

	def test_any_hello
		assert_equal "hello world",
		HolaEnder.hi("ruby")
	end

	def test_spanish_hello
		assert_equal "hola mundo",
		HolaEnder.hi("spanish")
	end
end