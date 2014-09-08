app = angular.module('myApp')

app.controller 'AllCtrl', ($scope, emails) ->
  $scope.emails = emails

