# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 
	window.bind_pretty_image = ->
		$("#attachments .thumbnail > a").prettyPhoto(
			autoplay_slideshow: false
			opacity: 0.80
			allow_resize: true 
		)
	isScrolledIntoView = (elem) ->
		docViewTop = $(window).scrollTop()
		docViewBottom = docViewTop + $(window).height()
		elemTop = $(elem).offset().top
		elemBottom = elemTop + $(elem).height()
		(elemBottom <= docViewBottom) and (elemTop >= docViewTop)