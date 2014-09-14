app = angular.module('myApp')

# Rails is our js_env object
app.controller 'AuthCtrl', ($scope, AccessToken, Rails) ->
  $scope.loginUrl = "//#{Rails.host}/oauth/authorize?response_type=token&client_id=#{Rails.application_id}&redirect_uri=http://#{Rails.host}"

