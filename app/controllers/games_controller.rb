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
		@games = doc.xpath("//div[contains(@class,'teams')]").collect {|node| node.text.strip.gsub(/\r/," ").gsub(/\n/," ")}
		@odds = doc.xpath("//li[contains(@style, 'width:572px;')]/ul").collect {|node| node.text.strip.gsub(/\r/," ").gsub(/\n/," ")}

		#ZIP
		@game_data = Hash.new

	end


end

# string = string.gsub(/\r/," ")
# string = string.gsub(/\n/," ")