/* global angular */
(function() {
  angular.module('app').controller('commentsCtrl', function($scope, $http) {
    $scope.setup = function(challenge_id) {
      $scope.challenge_id = challenge_id;
      $http.get('/api/v1/comments').then(function(response) {
        $scope.comments = response.data.filter(function(comment) {
          return comment.challenge_id === $scope.challenge_id;
        });
        console.log($scope.comments);
      });
    };
    $scope.createNewComment = function(body) {
      var params = {
        body: body,
        challenge_id: $scope.challenge_id
      };
      $http.post('/api/v1/comments', params).then(function(response) {
        $scope.newCommentBody = '';
      });
    };
  });
})();