Ext.regController 'welcome',

  index: ->
    currentUser = App.stores.currentUser.first()

    if not currentUser.data.active
      Ext.dispatch
        controller: 'userSession'
        action: 'new'
        historyUrl: 'login'

    else
      App.views.viewport.reveal('dashboardPanel')

