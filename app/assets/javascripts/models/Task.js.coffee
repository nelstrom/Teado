App.models.Task = Ext.regModel 'Task',
  fields: [
    {name: 'id',       type: 'number'}
    {name: 'name',     type: 'string'}
    {name: 'bucket',   type: 'string'}
    {name: 'done_at',  type: 'date', dateFormat: 'timestamp'}
  ]

  hasMany: { model: 'Tag', name: 'tags' }

  isTaggedAs: (name) ->
    match = false
    for tag in @tags().data.items
      return true if tag.data.name == name
    return match

  isDone: ->
    @data.done_at != ""
