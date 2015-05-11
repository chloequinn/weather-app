require 'yahoo_weatherman'
puts "Please enter your location: "
location = gets.chomp

def user_location(location)
	client = Weatherman::Client.new
	client.lookup_by_location(location)	
end

user_weather = user_location(location)

today = Time.new.strftime("%w").to_i 


puts "Here's your forecast for the week in #{location}: \n"

user_weather.forecasts.each do |forecast|
	day = forecast["date"]
	dayofweek = day.strftime("%w").to_i

	if dayofweek == today 
		weekday = "Today"
	elsif dayofweek == today + 1
		weekday = "Tomorrow"
	else 
		weekday = day.strftime("%A")
	end

	lowtemp_faren = (forecast["low"] * 1.8 + 32).round
	hightemp_faren = (forecast["high"] * 1.8 + 32).round
		
	puts weekday + " will be " + forecast["text"].downcase + " with a low of " + lowtemp_faren.to_s  + " and a high of " + hightemp_faren.to_s + " degrees Fahrenheit."
end


