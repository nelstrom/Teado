Ext.create Ext.data.Store,
  id: 'App.stores.taskbuckets'
  model: 'TaskBucket'
  autoLoad: true
  proxy:
    type: 'ajax'
    url: '/config.json'
    reader:
      type: 'json'
      root: 'taskbuckets'
