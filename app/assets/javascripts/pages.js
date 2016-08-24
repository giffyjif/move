var mapCallback = function(position) {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: position.coords.latitude, lng: position.coords.longitude},
    zoom: 16
    console.log(position.coords.latitude);
  });

  navigator.geolocation.getCurrentPosition(mapCallback);
};