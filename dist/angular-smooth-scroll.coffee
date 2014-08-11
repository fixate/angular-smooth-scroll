angular.module 'angularSmoothScroll', []

	.directive 'smoothScroll', [
		'$timeout', '$window', '$log',
		($timeout, $window, $log) ->
			restrict: 'AECM'
			link: (scope, element, attrs) ->
				$scope.isAniScrolling = false
				console.log element
	]


# isAniScrolling = false
# $html = $('html,body')
# $('a[href*=#]:not([href=#])').click ->
#   if location.pathname.replace(/^\//,'') == @.pathname.replace(/^\//,'') && \
#     location.hostname == @.hostname

#     target = $(@.hash)
#     target = $("[name=#{@.hash.slice(1)}]") unless target.length
#     if target.length
#       isAniScrolling = true
#       $html.animate({
#         scrollTop: target.offset().top
#       }, 1000, 'easeInOutQuart', -> isAniScrolling = false)
#       false

# $.easing.easeInOutQuart = (x, t, b, c, d) ->
#   return c / 2 * t * t * t * t + b  if (t /= d / 2) < 1
#   -c / 2 * ((t -= 2) * t * t * t - 2) + b

# # Let's also prevent mouse scrolling 'judder' when the user scrolls in middle of the animation.
# mouseWheelEvt = if /Firefox/i.test(navigator.userAgent) then "DOMMouseScroll" else "mousewheel"

# @.document.addEventListener mouseWheelEvt, ->
#   $html.stop() if isAniScrolling


