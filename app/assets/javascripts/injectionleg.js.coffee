# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@daysleg = ->
	today = new Date
	number = today.getDay() + 1
	textArea = document.getElementById('textArea')
	textArea.innerHTML = '<img src="http://diatracker.eu/dayleg' + number + '.jpg">'
	retu