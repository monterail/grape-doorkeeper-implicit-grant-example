app = angular.module('myApp')
app.service 'AccessToken', ($localStorage, $timeout) ->
  get:         -> $localStorage.token
  set: (token) -> $localStorage.token = token
  delete:      -> delete $localStorage.token

