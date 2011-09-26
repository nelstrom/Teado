App.models.Tag = Ext.regModel 'Tag',
  fields: [
    {name: 'id', type: 'number'}
    {name: 'name',  type: 'string'}
  ]

App.stores.tags = new Ext.data.Store
  model: 'Tag'
  autoLoad: true
  proxy:
    type: 'ajax'
    url: 'tags.json'
    reader:
      type: 'json'
      root: 'tags'

