require_relative 'test_helper'

class InsertAfterTest < Minitest::Test
  def test_it_is_a_module
    assert_kind_of Module, InsertAfter
  end

  def test_that_it_has_a_version_number
    refute_nil ::InsertAfter::VERSION
  end
end
