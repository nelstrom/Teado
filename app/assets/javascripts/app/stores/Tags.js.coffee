App.stores.tags = new Ext.data.Store
  model: 'Tag'
  autoLoad: true
  proxy:
    type: 'ajax'
    url: 'tags.json'
    reader:
      type: 'json'
      root: 'tags'

