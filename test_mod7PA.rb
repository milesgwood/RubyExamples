require 'test/unit'
load './mod7PA.rb'
class TestFactor < Test::Unit::TestCase
    def test_init
    	output = Point.new(5,7)
    	assert_equal 5, output.x
	assert_equal 7, output.y
	assert_not_equal 7, output.x
    end
    def test_overload
    	output = Point.new(5,7)
	compare = Point.new(5,7)
	compare2 = Point.new(5,8)
	assert(output==(compare))
	assert(! output==(compare2))
    end
    def test_sqr_dist
        p = Point.new(1,1)
	p2 = Point.new(2,3)
    	assert_equal 5, p.sqr_distance(p2)
    end
    def test_dist
        p = Point.new(1,1)
	p2 = Point.new(2,3)
    	assert_equal Math.sqrt(5), distance(p2)
    end
end
