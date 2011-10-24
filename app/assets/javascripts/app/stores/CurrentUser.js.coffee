Ext.create Ext.data.Store,
  model: 'CurrentUser'
  id: 'App.stores.currentUser'
  autoLoad: true
  proxy:
    type: 'ajax'
    url: 'users/current.json'
    reader:
      type: 'json'
      root: 'current_users'

