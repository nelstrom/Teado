Ext.regModel 'CurrentUser',
  fields: [
    {name: 'active', type: 'boolean'}
    {name: 'username',  type: 'string'}
  ]

App.stores.currentUser = new Ext.data.Store
  model: 'CurrentUser'
  proxy:
    type: 'ajax'
    url: 'users/current.json'
    reader:
      type: 'json'
      root: 'current_users'

