app = angular.module('myApp')

app.service 'User', ($http, Rails) ->
  base = "//#{Rails.host}/api/v1/users"

  all:    -> $http.get(base + '/')
  me:     -> $http.get(base + '/me')
  logout: -> $http.delete(base + '/logout')

