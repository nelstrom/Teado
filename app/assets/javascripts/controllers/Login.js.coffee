Ext.regController 'userSession',

  new: ->
    App.views.viewport.reveal('loginCardPanel')

  destroy: ->
    Ext.Ajax.request
      url: '/logout.json'
      success: (response, params) ->
        console.log 'logged out!'
        Ext.dispatch
          controller: 'userSession'
          action: 'new'
          historyUrl: 'login'

