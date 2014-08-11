(function() {
  angular.module('angularSmoothScroll', []).directive('smoothScroll', [
    '$log', '$timeout', '$window', function($log, $timeout, $window) {
      var currentYPosition, elemYPosition, smoothScroll;
      currentYPosition = function() {
        if ($window.pageYOffset) {
          return $window.pageYOffset;
        }
        if ($window.document.body.scrollTop) {
          return $window.document.body.scrollTop;
        }
        return 0;
      };
      elemYPosition = function(elemID) {
        var elem, node, y;
        elem = document.getElementById(elemID);
        if (elem) {
          y = elem.offsetTop;
          node = elem;
          while (node.offsetParent && node.offsetParent !== document.body) {
            node = node.offsetParent;
            y += node.offsetTop;
          }
          return y;
        }
        return 0;
      };
      smoothScroll = function(targetID, offSet) {
        var distance, i, leapY, speed, startY, step, stopY, timer, _results;
        startY = currentYPosition();
        stopY = elemYPosition(targetID) - offSet;
        distance = (stopY > startY ? stopY - startY : startY - stopY);
        if (distance < 100) {
          scrollTo(0, stopY);
          return;
        }
        speed = Math.round(distance / 100);
        if (speed >= 20) {
          speed = 20;
        }
        step = Math.round(distance / 25);
        leapY = (stopY > startY ? startY + step : startY - step);
        timer = 0;
        if (stopY > startY) {
          i = startY;
          while (i < stopY) {
            setTimeout('window.scrollTo(0, ' + leapY + ')', timer * speed);
            leapY += step;
            if (leapY > stopY) {
              leapY = stopY;
            }
            timer++;
            i += step;
          }
          return;
        }
        i = startY;
        _results = [];
        while (i > stopY) {
          setTimeout('window.scrollTo(0, ' + leapY + ')', timer * speed);
          leapY -= step;
          if (leapY < stopY) {
            leapY = stopY;
          }
          timer++;
          _results.push(i -= step);
        }
        return _results;
      };
      return {
        restrict: 'EACM',
        link: function(scope, element, attr) {
          return element.bind('click', function() {
            var offset, target;
            target = attr.smoothScroll || element[0].hash;
            target = target.replace('#', '');
            if (target) {
              offset = attr.offset || 0;
              return smoothScroll(target, offset);
            }
          });
        }
      };
    }
  ]).directive('smoothScrollJquery', [
    '$document', function($document) {
      return {
        restrict: 'AECM',
        link: function(scope, element, attr) {
          var $html, easing, hash, isAniScrolling, mouseWheelEvt, offset, speed, target;
          isAniScrolling = false;
          $html = $('html, body');
          hash = attr.smoothScrollJquery || element[0].hash;
          target = $(hash);
          if (!target.length) {
            target = $('[name=#{hash.slice(1)}]');
          }
          offset = attr.offset || 0;
          speed = parseInt(attr.speed) || 200;
          easing = attr.easing || 'swing';
          mouseWheelEvt = /Firefox/i.test(navigator.userAgent) ? "DOMMouseScroll" : "mousewheel";
          element.bind('click', function(e) {
            isAniScrolling = true;
            return $html.stop().animate({
              scrollTop: target.offset().top - offset
            }, speed, easing, function() {
              return isAniScrolling = false;
            });
          });
          $document.bind(mouseWheelEvt, function(e) {
            if (isAniScrolling) {
              return $html.stop();
            }
          });
        }
      };
    }
  ]);

}).call(this);
