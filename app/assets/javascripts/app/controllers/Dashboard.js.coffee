Ext.define 'App.controllers.dashboard',
  extend: 'Ext.app.Controller',
  views: [
    "App.views.Dashboard"
    "App.views.LoginCard"
    "App.views.MenuCard"
  ]

  index: () ->
    currentUser = App.stores.currentUser.first()

    if not currentUser.data.active
      Ext.dispatch
        controller: 'userSession'
        action: 'new'
        historyUrl: 'login'

    else
      App.views.viewport.reveal('menuCardPanel')
      dash = App.views.viewport.down('#dashboardPanel')
      dash.displayWelcomeMessage()

