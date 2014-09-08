app = angular.module('myApp')

app.controller 'MeCtrl', ($scope, user) ->
  $scope.user = user

