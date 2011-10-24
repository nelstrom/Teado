Ext.create Ext.data.Store,
  id: 'App.stores.tasks'
  model: 'Task'
  autoLoad: true
  proxy:
    type: 'rest'
    url: '/tasks.json'
    reader:
      type: 'json'
      root: 'tasks'
