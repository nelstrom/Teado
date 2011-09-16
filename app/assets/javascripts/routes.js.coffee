Ext.Router.draw (map) ->

  map.connect "welcome",
    controller: 'welcome'
    action: 'index'

  map.connect "login",
    controller: 'userSession'
    action: 'new'

  map.connect "logout",
    controller: 'userSession'
    action: 'destroy'
