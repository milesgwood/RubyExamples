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
    end
    def test_sqr_dist
        p = Point.new(1,1)
	p2 = Point.new(2,3)
    	assert_equal 5, p.sqr_distance(p2)
    end
    def test_dist
        p = Point.new(1,1)
	p2 = Point.new(2,3)
    	assert_equal Math.sqrt(5), p.distance(p2)
    end
    def test_pairs
      point1 = Point.new(1,1)
      point2 = Point.new(2,3)
      pair1 = Pair.new(point1, point2)
      pair2 = Pair.new(point2, point1)
      assert(pair1==(pair2))
      assert(pair1==pair2)
    end
    def test_edge
      point1 = Point.new(1,1)
      point2 = Point.new(2,3)
      pair1 = Edge.new(point1, point2)
      pair2 = Pair.new(point2, point1)
      assert(pair1==(pair2))
      assert(pair1==pair2)
    end
    def test_set_pairs_size_0
      point1 = Point.new(1,1)
      point2 = Point.new(2,3)
      point3 = Point.new(3,3)
      pair1 = Edge.new(point1, point2)
      pair2 = Pair.new(point2, point1)
      set = Point_Set.new()
      assert_equal(set.size, 0)
    end
    def test_set_pairs_size_3
      point1 = Point.new(1,1)
      point2 = Point.new(2,3)
      point3 = Point.new(3,3)
      pair1 = Edge.new(point1, point2)
      pair2 = Pair.new(point2, point1)
      set = Point_Set.new()
      assert_equal(set.size, 0)
      set.add(point1)
      set.add(point2)
      set.add(point3)
      assert_equal(set.size, 3)
    end
    def test_set_include
      point1 = Point.new(1,1)
      point2 = Point.new(2,3)
      point3 = Point.new(3,3)
      pair1 = Edge.new(point1, point2)
      pair2 = Pair.new(point2, point1)
      set = Point_Set.new()
      assert_equal(set.size, 0)
      set.add(point1)
      set.add(point2)
      set.add(point3)
      assert(set.include?(point2))
    end
    def test_set_include_same_values_and_different
      point1 = Point.new(1,1)
      point2 = Point.new(2,3)
      point3 = Point.new(3,3)
      set = Point_Set.new()
      assert_equal(set.size, 0)
      set.add(point1)
      set.add(point2)
      set.add(point3)
      assert(set.include?(Point.new(1,1)))
      assert(!set.include?(Point.new(2,1)))
    end
    def test_set_all_pairs
      point1 = Point.new(1,1)
      point2 = Point.new(2,3)
      point3 = Point.new(3,3)
      point4 = Point.new(4,4)
      pair1 = Edge.new(point1, point2)
      pair2 = Pair.new(point2, point1)
      set = Point_Set.new()
      assert_equal(set.size, 0)
      set.add(point1)
      set.add(point2)
      set.add(point3)
      assert_equal(set.all_pairs.size, 3)
    end
    def test_set_all_pairs2
      point1 = Point.new(1,1)
      point2 = Point.new(2,3)
      point3 = Point.new(3,3)
      point4 = Point.new(4,4)
      pair1 = Edge.new(point1, point2)
      pair2 = Pair.new(point2, point1)
      set = Point_Set.new()
      assert_equal(set.size, 0)
      set.add(point1)
      set.add(point2)
      set.add(point3)
      assert_equal(set.all_pairs.size, 3)
      set.add(point4)
      assert_equal(set.all_pairs.size, 6)
    end

    def test_closest_pair
      point1 = Point.new(1,2)
      point2 = Point.new(3,3)
      point3 = Point.new(3,8)
      point4 = Point.new(3,7)
      point5 = Point.new(4,10)
      correct = Pair.new(point3, point4)
      set = Point_Set.new()
      set.add(point1)
      set.add(point2)
      set.add(point3)
      set.add(point4)
      set.add(point5)
      assert_equal( correct, set.closest_pair)
    end

    def test_is_hull
      point1 = Point.new(1,2)
      point2 = Point.new(3,3)
      point3 = Point.new(3,4)
      point4 = Point.new(3,5)
      point5 = Point.new(4,1)
      set = Point_Set.new()
      correct = Pair.new(point1,point5)
      set.add(point1)
      set.add(point2)
      set.add(point3)
      set.add(point4)
      set.add(point5)
      assert(set.is_hull_edge(correct))
    end

    def test_convex_hull
      point1 = Point.new(1,2)
      point2 = Point.new(3,3)
      point3 = Point.new(3,4)
      point4 = Point.new(3,5)
      point5 = Point.new(4,1)
      set = Point_Set.new()
      correct = Pair.new(point1,point5)
      set.add(point1)
      set.add(point2)
      set.add(point3)
      set.add(point4)
      set.add(point5)
      puts set.convex_hull
    end
end
