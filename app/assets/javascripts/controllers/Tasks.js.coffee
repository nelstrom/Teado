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
