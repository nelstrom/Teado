Ext.regController 'login',

  index: () ->
    console.log 'login#index'
    App.views.viewport.reveal('loginCardPanel')
    Ext.Ajax.request
      url: '/users/current.json'
      success: (response, params) ->
        console.log 'the current user route works!'
      failure: (response, params) ->
        console.log "the current user route doesn't work!"
