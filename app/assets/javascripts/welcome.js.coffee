# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@day = ->
	today = new Date
	number = today.getDay() + 1
	document.write '<img src="http://diatracker.eu/day' + number + '.jpg">'
	return