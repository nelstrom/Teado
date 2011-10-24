Ext.create Ext.data.Store,
  id: 'App.stores.tags'
  model: 'Tag'
  autoLoad: true
  proxy:
    type: 'ajax'
    url: 'tags.json'
    reader:
      type: 'json'
      root: 'tags'

