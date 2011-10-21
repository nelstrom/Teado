Ext.regController 'Tasks'
  store: App.stores.tasks

  index: ->
    menucard = App.views.viewport.getComponent("menuCardPanel")
    packet = menucard.getComponent("tasksPacket")
    form = packet.getComponent("tasksForm")

    packet.setActiveItem('tasksList')

  newForm: () ->
    console.log 'tasks#new'
    menucard = App.views.viewport.getComponent("menuCardPanel")
    packet = menucard.getComponent("tasksPacket")
    form = packet.getComponent("tasksForm")

    # Load the new model into the form:
    model = new App.models.Task()
    form.load(model)
    # Reveal the form:
    packet.setActiveItem('tasksForm')

  editForm:(params) ->
    menucard = App.views.viewport.getComponent("menuCardPanel")
    packet = menucard.getComponent("tasksPacket")
    form = packet.getComponent("tasksForm")
    taskForm = App.views.viewport.down('#tasksForm');

    # Load the model into the form:
    model = @store.getAt(params.index)
    form.load(model)
    # Reveal the form:
    packet.setActiveItem('tasksForm')

  create: (params) ->
    params.form.submit(
      scope: this
      success: ->
        @store.load()
        @index()
      failure: (form, result) ->
        # TODO: show errors on the form
        console.log 'task creation failed'
        console.log 'result: ', result
    )

  update: (params) ->
    model = params.form.getRecord()

    params.form.submit(
      scope: this
      url: "/tasks/#{model.data.id}.json"
      method: "PUT"
      success: ->
        console.log 'task updated successfully'
        @store.load()
        @index()
      failure: (form, result) ->
        console.log 'task update failed'
        console.log 'result: ', result
    )

  destroy: (params) ->
    model = params.form.getRecord()

    params.form.submit(
      scope: this
      url: "/tasks/#{model.data.id}.json"
      method: "DELETE"
      success: ->
        console.log 'task was successfully destroyed'
        @store.load()
        @index()
      failure: (form, result) ->
        console.log 'task destruction failed'
    )

  toggleDone: (params) ->
    model = @store.getAt(params.index)

    # Update the local copy of the model
    if model.isDone()
      model.set('done_at', undefined)
    else
      model.set('done_at', new Date())

    # Sync with the server
    # model.save({
    #   # task: {done_at: 'blah'}
    #   success: -> console.log 'successfully saved model'
    #   failure: -> console.log 'failed to save model'
    # })

    Ext.Ajax.request
      scope: this
      url: "/tasks/#{model.data.id}/toggle.json"
      method: "POST"
      success: (response, params) ->
        console.log "#toggleDone posted successfully"
        @store.load()
