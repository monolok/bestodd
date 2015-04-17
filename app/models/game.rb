class Game < ActiveRecord::Base
require 'open-uri'

	def self.send_bet
		@games = Array.new
		@odds = Array.new

		#get URL
		url = "http://www.ruedesjoueurs.com/pronostics/foot.html"
		doc = Nokogiri::HTML(open(url))
		@show = doc.at_css("title").text

		#XPATH
		@games = doc.xpath("//div[contains(@class,'teams')]").collect {|node| node.text.strip.gsub(/\r/," ").gsub(/\n/," ")}
		@odds = doc.xpath("//li[contains(@style, 'width:572px;')]/ul").collect {|node| node.text.strip.gsub(/\r/," ").gsub(/\n/," ")}

		#ZIP
		@game_data = @games.zip @odds

		#mailer logic
		SendBet.bet_data(@game_data).deliver_now
	end

end
