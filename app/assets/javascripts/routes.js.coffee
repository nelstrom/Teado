Ext.Router.draw (map) ->

  map.connect "login",
    controller: 'login'
    action: 'index'

  map.connect "logout",
    controller: 'login'
    action: 'logout'
