/* global angular */
(function() {
  angular.module('app').controller('commentsCtrl', function($scope, $http) {
    $scope.setup = function() {
      $http.get('/api/v1/comments').then(function(response) {
        $scope.comments = response.data;
      });
    };
    $scope.createNewComment = function(body) {
      var params = {
        body: body
      };
      $http.post('/api/v1/comments', params).then(function(response) {
        $scope.newCommentBody = '';
      });
    };
  });
})();