(function() {
  angular.module('angularSmoothScroll', []).directive('smoothScroll', [
    '$timeout', '$window', '$log', function($timeout, $window, $log) {
      return {
        restrict: 'AECM',
        link: function(scope, element, attrs) {
          $scope.isAniScrolling = false;
          return console.log(element);
        }
      };
    }
  ]);

}).call(this);
