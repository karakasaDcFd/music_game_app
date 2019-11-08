require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  def setup
    @match = Match.new(restriction_level: 18,
                       date: DateTime.new(2019, 11, 14, 16, 15, 0, 0.375),
                       place: "ラウンドワン京都河原町店")
  end

  test "associated set_lists should be destroyed" do
    @match.save
    @match.set_lists.create!(title: "Awakening")
    assert_difference 'SetList.count', -1 do
      @match.destroy
    end
  end

  test "associated ban_lists should be destroyed" do
    @match.save
    @match.ban_lists.create!(title: "Joyeuse")
    assert_difference 'BanList.count', -1 do
      @match.destroy
    end
  end
end
