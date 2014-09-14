app = angular.module('myApp', ['ui.router', 'templates', 'ngStorage'])

app.config ($httpProvider) ->
  $httpProvider.interceptors.push('tokenInterceptor')
  $httpProvider.responseInterceptors.push('unauthorizedInterceptor')

app.factory 'tokenInterceptor', (AccessToken, Rails) ->
  request: (config) ->
    # Send AccessToken only to our API
    if config.url.indexOf("//#{Rails.host}") == 0
      token = AccessToken.get()
      config.headers['Authorization'] = "Bearer #{token}" if token

    config

app.factory 'unauthorizedInterceptor', ($q, $injector) ->
  return (promise) ->
    success = (response) -> response
    error   = (response) ->
      if response.status == 401
        $injector.get('$state').go('401')
      $q.reject(response)

    promise.then success, error

