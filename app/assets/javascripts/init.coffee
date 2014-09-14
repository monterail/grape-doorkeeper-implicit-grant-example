app = angular.module('myApp', ['ui.router', 'templates', 'ngStorage'])

app.config ($httpProvider) ->
  $httpProvider.interceptors.push('tokenInterceptor')

app.factory 'tokenInterceptor', (AccessToken, Rails) ->
  request: (config) ->
    # Send AccessToken only to our API
    if config.url.indexOf("//#{Rails.host}") == 0
      token = AccessToken.get()
      config.headers['Authorization'] = "Bearer #{token}" if token

    config

