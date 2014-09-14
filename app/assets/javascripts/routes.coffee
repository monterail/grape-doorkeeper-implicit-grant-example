app = angular.module('myApp')

app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise ->
    '/'

  $stateProvider
    .state 'index',
      url: '/'
      templateUrl: 'index.html'

  $stateProvider
    .state 'me',
      url: '/me'
      controller: 'MeCtrl'
      resolve:
        user: (User) ->
          User.me().then (response) -> response.data
      templateUrl: 'me.html'

  $stateProvider
    .state 'all',
      url: '/all'
      controller: 'AllCtrl'
      resolve:
        emails: (User) ->
          User.all().then (response) -> response.data
      templateUrl: 'all.html'

  $stateProvider
    .state 'accessToken',
      url: '/access_token=:response'
      controller: ($window, $state, $stateParams, AccessToken) ->
        token = $stateParams.response.match(/^(.*?)&/)[1]
        AccessToken.set(token)

        $state.go 'index'

  $stateProvider
    .state '401',
      url: '/unauthorized'
      controller: ($state, AccessToken) ->
        $state.go 'index' if AccessToken.get()
      templateUrl: '401.html'

