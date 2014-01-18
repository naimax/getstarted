app = angular.module("app", ['ui.bootstrap', 'ngRoute', 'ngCookies', 'ngSanitize', 'ngProgressLite'])


app.config ($routeProvider, $locationProvider, $httpProvider, ngProgressLiteProvider, $rootScopeProvider) ->
  
  $routeProvider.when("/",
    templateUrl: '/build/shared/requests.html'
    controller: 'requestsCtrl'
    headerTitle: 'Все заявки'
    auth: true
  )



  $locationProvider.html5Mode false
  $locationProvider.hashPrefix ""

isEven = (v) ->
  v%2 is 0

app.run ($rootScope, $http, $location, $window, mnpUser, $cookies) ->

  if window.isAuth is false
    mnpUser.logout()
    $location.path('/login').search({})

  $rootScope.$on '$routeChangeSuccess', (event, current, previous) ->
      if current.$$route
        $rootScope.pageTitle = "Back Office Tele2 | " + current.$$route.headerTitle
      else
        $rootScope.pageTitle = "Back Office Tele2"

  $rootScope.$on '$routeChangeStart', (event, next, current) ->
    if next.$$route.auth
      if not mnpUser.isLogged()
        $location.path('/login').search({})


placeholders = () ->
  jQuery.placeholder.shim()  if jQuery.placeholder

setTimeout ->
  placeholders()
, 500




