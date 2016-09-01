var mapCallback = function(position) {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: position.coords.latitude, lng: position.coords.longitude},
    zoom: 16
  });
};
navigator.geolocation.getCurrentPosition(mapCallback);