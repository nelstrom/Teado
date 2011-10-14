App.stores.tasks = new Ext.data.Store
  model: 'Task'
  autoLoad: true
  proxy:
    type: 'rest'
    url: '/tasks.json'
    reader:
      type: 'json'
      root: 'tasks'
