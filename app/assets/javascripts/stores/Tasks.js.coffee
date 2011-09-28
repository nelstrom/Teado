App.models.Task = Ext.regModel 'Task',
  fields: [
    {name: 'id', type: 'number'}
    {name: 'name',  type: 'string'}
    {name: 'bucket',  type: 'string'}
  ]

  hasMany: { model: 'Tag', name: 'tags' }

  isTaggedAs: (name) ->
    match = false
    for tag in @tags().data.items
      return true if tag.data.name == name
    return match

App.stores.tasks = new Ext.data.Store
  model: 'Task'
  autoLoad: true
  proxy:
    type: 'ajax'
    url: '/tasks.json'
    reader:
      type: 'json'
      root: 'tasks'
