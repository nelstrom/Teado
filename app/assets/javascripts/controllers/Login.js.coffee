Ext.regController 'login',

  index: () ->
    console.log 'login#index'
    App.views.viewport.reveal('loginCardPanel')
