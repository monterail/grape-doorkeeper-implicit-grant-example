app = angular.module('myApp')

# Rails is our js_env object
app.controller 'AuthCtrl', ($scope, $state, $rootScope, AccessToken, Rails, User) ->
  $scope.loginUrl = "//#{Rails.host}/oauth/authorize?response_type=token&client_id=#{Rails.application_id}&redirect_uri=http://#{Rails.host}"

  $scope.logout = ->
    User.logout().then ->
      AccessToken.delete()
      setLoggedIn false
      $state.go 'index'

  setLoggedIn = (isLoggedIn) ->
    $scope.loggedIn = !!isLoggedIn

  setLoggedIn AccessToken.get()
  $rootScope.$on '$stateChangeSuccess', ->
    setLoggedIn AccessToken.get()

