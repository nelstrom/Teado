App.models.TaskBucket = Ext.regModel 'TaskBucket',
  fields: [
    {name: 'text',  type: 'string'}
    {name: 'value',  type: 'string'}
  ]

App.stores.taskbuckets = new Ext.data.Store
  model: 'TaskBucket'
  autoLoad: true
  proxy:
    type: 'ajax'
    url: '/config.json'
    reader:
      type: 'json'
      root: 'taskbuckets'
