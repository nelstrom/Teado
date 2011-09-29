Ext.regController 'userSession',

  new: ->
    App.views.viewport.reveal('loginCardPanel')

  create: (params) ->
    params.form.setLoading(true)
    params.form.submit(
      success: ->
        Ext.dispatch
          controller: 'dashboard'
          action: 'index'
          historyUrl: 'dashboard'
      failure: (form, result) ->
        params.form.setLoading(false)
        params.form.showErrors(result)
    )

  destroy: ->
    Ext.Ajax.request
      url: '/logout.json'
      success: (response, params) ->
        Ext.dispatch
          controller: 'userSession'
          action: 'new'
          historyUrl: 'login'

