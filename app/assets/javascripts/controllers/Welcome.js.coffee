Ext.regController 'welcome',

  index: ->
    App.stores.currentUser.load
      scope: this
      callback: ->
        currentUser = App.stores.currentUser.first()

        if not currentUser.data.active
          Ext.dispatch
            controller: 'userSession'
            action: 'new'
            historyUrl: 'login'

        else
          App.views.viewport.reveal('dashboardPanel')

