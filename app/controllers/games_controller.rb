class GamesController < ApplicationController
require 'open-uri'

	def index
		@games = Array.new
		@odds = Array.new

		#get URL
		url = "http://www.ruedesjoueurs.com/pronostics/foot.html"
		doc = Nokogiri::HTML(open(url))
		@show = doc.at_css("title").text

		#XPATH
		@games = doc.xpath("//ul[contains(@class, 'matchs classement uk-list')]").collect {|node| node.text.strip.gsub(/\r/," ").gsub(/\n/," ")}
		#@??? = ???
		#ZIP
		@game_data = @games.zip @odds

	end


end

# string = string.gsub(/\r/," ")
# string = string.gsub(/\n/," ")


	

# >> @budget = [ 100, 150, 25, 105 ]
# => [100, 150, 25, 105]
# >> @actual = [ 120, 100, 50, 100 ]
# => [120, 100, 50, 100]

# >> @budget.zip @actual
# => [[100, 120], [150, 100], [25, 50], [105, 100]]

# >> @budget.zip(@actual).each do |budget, actual|
# ?>   puts budget
# >>   puts actual
# >> end

