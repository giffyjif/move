/* global angular App */
App.activity = App.cable.subscriptions.create("ActivityChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    var $scope = angular.element(document.getElementById('commentsCtrl')).scope(); // get the scope from the angular controller
    $scope.comments.push(data); // add the new message received from the websocket
    $scope.$apply(); // force angular to refresh
  }
});
