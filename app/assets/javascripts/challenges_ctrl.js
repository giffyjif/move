/* global angular */
// (function() {
  // angular.module('app').controller('challengesCtrl', function($scope, $http)

(function() {
  angular.module('app').controller('challengesCtrl', function($scope, $http) {


    $scope.saveMarker = function(inputMarker) {
      params = {location: inputMarker.location};
      $http.post('/api/challenges/create', params).then(function(response) {

      }, function(errors) {

      });
    };
  });
})();
