require 'test_helper'

class SendBetTest < ActionMailer::TestCase
  test "bet_data" do
    mail = SendBet.bet_data
    assert_equal "Bet data", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
