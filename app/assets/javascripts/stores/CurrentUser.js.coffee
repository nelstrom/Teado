App.stores.currentUser = new Ext.data.Store
  model: 'CurrentUser'
  autoLoad: true
  proxy:
    type: 'ajax'
    url: 'users/current.json'
    reader:
      type: 'json'
      root: 'current_users'

