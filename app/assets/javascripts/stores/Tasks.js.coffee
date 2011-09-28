App.models.Task = Ext.regModel 'Task',
  fields: [
    {name: 'id', type: 'number'}
    {name: 'name',  type: 'string'}
    {name: 'bucket',  type: 'string'}
  ]

App.stores.tasks = new Ext.data.Store
  model: 'Task'
  autoLoad: true
  proxy:
    type: 'ajax'
    url: '/tasks.json'
    reader:
      type: 'json'
      root: 'tasks'
