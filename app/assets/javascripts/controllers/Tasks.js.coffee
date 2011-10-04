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
    controller = this
    params.form.submit(
      success: ->
        console.log 'task created successfully'
        controller.store.load()
        controller.index()
      failure: (form, result) ->
        console.log 'task creation failed'
        console.log 'result: ', result
    )

  update: (params) ->
    controller = this
    model = params.form.getRecord()

    params.form.submit(
      url: "/tasks/#{model.data.id}.json"
      method: "PUT"
      success: ->
        console.log 'task updated successfully'
        controller.store.load()
        controller.index()
      failure: (form, result) ->
        console.log 'task update failed'
        console.log 'result: ', result
    )

  destroy: (params) ->
    controller = this
    model = params.form.getRecord()

    params.form.submit(
      url: "/tasks/#{model.data.id}.json"
      method: "DELETE"
      success: ->
        console.log 'task was successfully destroyed'
        controller.store.load()
        controller.index()
      failure: (form, result) ->
        console.log 'task destruction failed'
    )

  toggleDone: (params) ->
    controller = this
    model = @store.getAt(params.index)

    Ext.Ajax.request
      url: "/tasks/#{model.data.id}/toggle.json"
      method: "POST"
      success: (response, params) ->
        console.log "#toggleDone posted successfully"
        controller.store.load()
