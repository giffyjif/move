/* global angular google*/
(function() {
  angular.module('app').controller('challengesCtrl', function($scope, $http, $compile) {
    $http.get('api/v1/challenges.json').then(function(response) {
      $scope.challenges = response.data;
    });

    $scope.setup = function() {
      var mapCallback = function(position) {
        var marker;
        var infowindow;
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: position.coords.latitude, lng: position.coords.longitude},
          zoom: 16
        });
        function html(marker) {
          var html = "<div ng-app='app'>" +
                      "<table ng-controller='challengesCtrl'>" +
                         "<tr><td>Movement:</td> <td><input ng-model='inputDescription' id='description'/> </td> </tr>" +
                         "<tr><td>Details:</td> <td><input ng-model='inputAddress' id='address'/></td> </tr>" +
                         "<tr><td></td><td><input type='submit' value='Save & Close' ng-click='saveData(inputDescription, inputAddress, inputLat, inputLng)'/></td></tr>" +
                         "</div>";
          return html;
        }

        google.maps.event.addListener(map, "click", function(event) {
          marker = new google.maps.Marker({
            position: event.latLng,
            map: map
          });
          infowindow = new google.maps.InfoWindow({
            content: html(marker)
          });
          var compiled = $compile(html(marker))($scope);
          $scope.marker = marker;
          google.maps.event.addListener(marker,"click", function() {
            $scope.latLng = marker.position;
            $scope.$apply();
            $scope.setLatLng(marker.position.lat(), marker.position.lng());
            infowindow.setContent(compiled[0]);
            infowindow.open(map, marker);
          });
        });
      };
      navigator.geolocation.getCurrentPosition(mapCallback);
    };

    $scope.setLatLng = function(markerLat, markerLng) {
      $scope.inputLat = markerLat;
      $scope.inputLng = markerLng;
    };

    $scope.saveData = function(description, address, lat, lng) {
      console.log('hello');
      var params = {
        description: description,
        challenge_location: address,
        lat: lat,
        lng: lng
      };
      console.log(params);
      $http.post('api/v1/challenges.json', params).then(function(response) {
        $scope.challenges.push(response.data);
      });
    };

    window.$scope = $scope;
    window.$compile = $compile;
  });
})();
