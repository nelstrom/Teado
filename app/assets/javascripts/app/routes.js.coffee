Ext.Router.draw (map) ->

  map.connect "dashboard",
    controller: 'dashboard'
    action: 'index'

  map.connect "login",
    controller: 'userSession'
    action: 'new'

  map.connect "logout",
    controller: 'userSession'
    action: 'destroy'
