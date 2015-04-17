class SendBet < ApplicationMailer
default from: "noreply@monolok.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_bet.bet_data.subject
  #
  def bet_data(game_data)
    @game_data = game_data

    mail to: "antoinebe35@gmail.com"
  end
end
