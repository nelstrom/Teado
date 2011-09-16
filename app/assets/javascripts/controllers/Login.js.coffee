Ext.regController 'login',

  index: () ->
    console.log 'login#index'
    App.views.viewport.reveal('loginCardPanel')
    Ext.Ajax.request
      url: '/users/current.json'
      success: (response, params) ->
        console.log 'response', response
        console.log 'params', params
        console.log 'the current user route works!'
        window.debug = response
        res = JSON.parse(response.responseText)
        if res.active
          console.log '...and you are logged in!'
          App.views.viewport.reveal('dashboardPanel')
        else
          console.log '...but you are NOT logged in!'
          App.views.viewport.reveal('loginCardPanel')
      failure: (response, params) ->
        console.log "the current user route doesn't work!"

  logout: ->
    Ext.Ajax.request
      url: '/logout.json'
      success: (response, params) ->
        console.log 'logged out!'
        Ext.dispatch
          controller: 'login'
          action: 'index'

