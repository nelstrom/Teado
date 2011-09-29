Ext.regController 'userSession',

  new: ->
    App.views.viewport.reveal('loginCardPanel')

  create: (params) ->
    params.form.setLoading(true)
    params.form.submit(
      success: (form, response) ->
        App.stores.currentUser.removeAll()
        App.stores.currentUser.add(response.current_users[0])

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
        responseObject = JSON.parse(response.responseText)
        App.stores.currentUser.removeAll()
        App.stores.currentUser.add(responseObject.current_users[0])

        Ext.dispatch
          controller: 'userSession'
          action: 'new'
          historyUrl: 'login'

