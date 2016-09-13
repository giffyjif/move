/* global angular google */
function bindInfoWindow(marker, map, infowindow) {
  marker.addListener('click', function() {
    infowindow.open(map, this);
  });
}

(function() {
  angular.module('app').controller('showCtrl', function($scope, $http, $compile) {
    $scope.setup = function() {
      $http.get('api/v1/challenges.json').then(function(response) {
        $scope.challenges = response.data;
        var mapCallback = function(position) {
          var map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: position.coords.latitude, lng: position.coords.longitude},
            zoom: 16
          });
          for (var i = 0; i < $scope.challenges.length; i++) {
            var myLatLng = {lat: $scope.challenges[i].lat, lng: $scope.challenges[i].lng};
            var marker = new google.maps.Marker({
              position: myLatLng,
              map: map
            });
            var infowindow = new google.maps.InfoWindow({
              content: $scope.challenges[i].description
            });

            // marker.addListener('click', function() {
            //   infowindow.open(map, marker);
            // });
            bindInfoWindow(marker, map, infowindow);

          }

          
        };

        navigator.geolocation.getCurrentPosition(mapCallback);
      });
    };
    window.$scope = $scope;
    window.$compile = $compile;
  });
})();
