require 'test_helper'

class BanListTest < ActiveSupport::TestCase
  def setup
    @match = matches(:one)
    @ban_list = @match.ban_lists.build(title: "Joyeuse")
  end

  test "should be valid" do
    assert @ban_list.valid?
  end

  test "match id should be present" do
    @ban_list.match_id = nil
    assert_not @ban_list.valid?
  end

  test "title should be present" do
    @ban_list.title = "   "
    assert_not @ban_list.valid?
  end
end
