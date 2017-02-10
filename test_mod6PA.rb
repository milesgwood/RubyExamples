require 'test/unit'
load './mod6PA.rb'
class TestFactor < Test::Unit::TestCase
    def test_factor
    	output = factors(-1)
    	assert_equal [], output
    end
    def test_factor1
    	output = factors(1)
    	assert_equal [1], output
    end
    def test_factor9
    	output = factors(9)
    	assert_not_equal [], output
    end
    def test_factor6
    	output = factors(6)
    	assert_equal [1,2,3,6], output
    end
end
class TestPrimes < Test::Unit::TestCase
  def test_prime_less_than_2
    output = primes(1)
    assert_equal [], output
  end
  def test_prime_less_than_2_2
    output = primes(0)
    assert_equal [], output
  end
  def test_prime_less_than_2_3
    output = primes(-10)
    assert_equal [], output
  end
  def test_prime_2
    output = primes(2)
    assert_equal [2], output
  end
  def test_prime_10
    output = primes(10)
    assert_equal [2,3,5,7], output
  end
end
class TestPrimeFactors < Test::Unit::TestCase
  def test_primefact1
    output = prime_factors(1)
    assert_equal [], output
  end
  def test_primefact12
    output = prime_factors(12)
    assert_equal [2,3], output
  end
end
class TestPerfects < Test::Unit::TestCase
  def test_perf1
    output = perfects(10)
    assert_equal [6], output
  end
  def test_perf2
    output = perfects(5)
    assert_equal [], output
  end
  def test_perf500
    output = perfects(500)
    assert_equal [6,28,496], output
  end
end
class TestPythag < Test::Unit::TestCase
  def test_perf1
    output = perfects(10)
    assert_equal [6], output
  end
  def test_perf2
    output = perfects(5)
    assert_equal [], output
  end
  def test_perf500
    output = perfects(500)
    assert_equal [6,28,496], output
  end
end
