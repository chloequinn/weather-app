#use yahoo_weatherman gem
require 'yahoo_weatherman'
#ask user for location - can be zip, city, etc.
puts "Please enter your location: "
location = gets.chomp

#method to access location's weather via gem
def user_location(location)
	client = Weatherman::Client.new
	client.lookup_by_location(location)	
end

user_weather = user_location(location)

#create var for today as a day of week
today = Time.new.strftime("%w").to_i 


puts "Here's your forecast for the week in #{location}: \n"

#loop through location's weather info, use forecast method to access needed details of 5-day forecast 
user_weather.forecasts.each do |forecast|
	day = forecast["date"]
	#assigns number to day of week 
	dayofweek = day.strftime("%w").to_i

	#change day of week for current and next day to "Today" & "Tomorrow"
	#if number for weekday matches that of today var, print "Today"
	if dayofweek == today 
		weekday = "Today"
	#if number for weekday matches that of tomorrow, print "Tomorrow"
	elsif dayofweek == today + 1
		weekday = "Tomorrow"
	#else use name of weekday
	else 
		weekday = day.strftime("%A")
	end
	#convert high and low temps to Fahrenheit
	lowtemp_faren = (forecast["low"] * 1.8 + 32).round
	hightemp_faren = (forecast["high"] * 1.8 + 32).round
	#output 5-day forcast to user	
	puts weekday + " will be " + forecast["text"].downcase + " with a low of " + lowtemp_faren.to_s  + " and a high of " + hightemp_faren.to_s + " degrees Fahrenheit."
end


