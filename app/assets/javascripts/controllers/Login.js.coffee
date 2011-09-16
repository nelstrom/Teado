Ext.regController 'userSession',

  new: ->
    App.views.viewport.reveal('loginCardPanel')

  create: () ->
    console.log 'post login details to server'
    Ext.Ajax.request
      url: '/users/create.json'
      success: (response, params) ->
        res = JSON.parse(response.responseText)
        if res.active
          console.log '...and you are logged in!'
          App.views.viewport.reveal('dashboardPanel')
        else
          console.log '...but you are NOT logged in!'
          App.views.viewport.reveal('loginCardPanel')
      failure: (response, params) ->
        console.log "the current user route doesn't work!"

  destroy: ->
    Ext.Ajax.request
      url: '/logout.json'
      success: (response, params) ->
        console.log 'logged out!'
        Ext.dispatch
          controller: 'userSession'
          action: 'new'
          historyUrl: 'login'

