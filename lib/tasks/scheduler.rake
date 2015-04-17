desc "This task is called by the Heroku scheduler add-on"

task :send_bet => :environment do
	puts "Sending e-mail..."
	Game.send_bet
	puts "done."
end