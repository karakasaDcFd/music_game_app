require 'test_helper'

class SetListTest < ActiveSupport::TestCase
  def setup
    @match = matches(:one)
    @set_list = @match.set_lists.build(title: "Awakening")
  end

  test "should be valid" do
    assert @set_list.valid?
  end

  test "match id should be present" do
    @set_list.match_id = nil
    assert_not @set_list.valid?
  end

  test "title should be present" do
    @set_list.title = "   "
    assert_not @set_list.valid?
  end
end
