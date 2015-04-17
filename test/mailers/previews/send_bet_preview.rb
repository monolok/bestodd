# Preview all emails at http://localhost:3000/rails/mailers/send_bet
class SendBetPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/send_bet/bet_data
  def bet_data
    SendBet.bet_data
  end

end
