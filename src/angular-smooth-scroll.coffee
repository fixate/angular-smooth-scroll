angular.module 'smoothScroll', []

	.directive('smoothScroll', [
		'$log', '$timeout', '$window', ($log, $timeout, $window) ->
			# get current vertical position
			currentYPosition = ->
				# Firefox, Chrome, Opera, Safari
				return $window.pageYOffset if $window.pageYOffset

				# Internet Explorer 6, 7 and 8
				return $window.document.body.scrollTop if $window.document.body.scrollTop
				0

			# get the vertical position of a DOM element
			elemYPosition = (elemID) ->
				elem = document.getElementById(elemID)

				if elem
					y = elem.offsetTop
					node = elem
					while node.offsetParent and node.offsetParent isnt document.body
						node = node.offsetParent
						y += node.offsetTop
					return y
				0

			# smooth scroll to element with a specific ID without offset
			smoothScroll = (targetID, offSet) ->
				startY = currentYPosition()
				stopY = elemYPosition(targetID) - offSet
				distance = (if stopY > startY then stopY - startY else startY - stopY)

				if distance < 100
					scrollTo 0, stopY
					return

				speed = Math.round(distance / 100)
				speed = 20 if speed >= 20
				step = Math.round(distance / 25)
				leapY = (if stopY > startY then startY + step else startY - step)
				timer = 0

				if stopY > startY
					i = startY

					while i < stopY
						# TODO: Using setTimeout with string to slow down animation (with function reference it is too fast)
						# Have not found a proper alternative yet, except using jQuery animate
						setTimeout 'window.scrollTo(0, '+leapY+')', timer * speed

						leapY += step
						leapY = stopY if leapY > stopY
						timer++
						i += step
					return
				i = startY

				while i > stopY
					# TODO: Using setTimeout with string to slow down animation (with function reference it is too fast)
					# Have not found a proper alternative yet, except using jQuery animate
					setTimeout 'window.scrollTo(0, '+leapY+')', timer * speed

					leapY -= step
					leapY = stopY if leapY < stopY
					timer++
					i -= step

			restrict: 'EACM'
			link: (scope, element, attr) ->
				element.bind 'click', ->
					target = attr.smoothScroll or element[0].hash
					target = target.replace('#', '')
					if target
						offset = attr.offset or 0
						smoothScroll target, offset
	])

	.directive 'smoothScrollJquery', [
		'$document', ($document) ->
			restrict: 'AECM'
			link: (scope, element, attr) ->

				isAniScrolling = false
				$html = $('html, body')
				hash = attr.smoothScrollJquery || element[0].hash
				target = $(hash)
				target = $('[name=#{hash.slice(1)}]') unless target.length
				offset = attr.offset or 0
				speed = parseInt(attr.speed) or 200
				easing = attr.easing or 'swing'
				mouseWheelEvt = if /Firefox/i.test(navigator.userAgent) then "DOMMouseScroll" else "mousewheel"

				element.bind 'click', (e) ->
					isAniScrolling = true
					$html.stop().animate({
						scrollTop: target.offset().top - offset
					}, speed, easing, -> isAniScrolling = false)

				$document.bind mouseWheelEvt, (e) ->
					$html.stop() if isAniScrolling

				return
	]
