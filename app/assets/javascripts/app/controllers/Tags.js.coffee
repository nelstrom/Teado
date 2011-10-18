Ext.regController 'Tags'
  store: App.stores.tags

  index: ->
    menucard = App.views.viewport.getComponent("menuCardPanel")
    packet = menucard.getComponent("tagsPacket")
    form = packet.getComponent("tagsForm")

    packet.setActiveItem('tagsList')

  newForm:() ->
    menucard = App.views.viewport.getComponent("menuCardPanel")
    packet = menucard.getComponent("tagsPacket")
    form = packet.getComponent("tagsForm")

    # Load the new model into the form:
    model = new App.models.Tag()
    form.load(model)
    # Reveal the form:
    packet.setActiveItem('tagsForm')

  editForm:(params) ->
    menucard = App.views.viewport.getComponent("menuCardPanel")
    packet = menucard.getComponent("tagsPacket")
    form = packet.getComponent("tagsForm")
    tagForm = App.views.viewport.down('#tagsForm');

    # Load the model into the form:
    model = @store.getAt(params.index)
    form.load(model)
    # Reveal the form:
    packet.setActiveItem('tagsForm')

  create: (params) ->
    controller = this
    params.form.submit(
      success: ->
        console.log 'tag created successfully'
        controller.store.load()
        controller.index()
      failure: (form, result) ->
        console.log 'tag creation failed'
        console.log 'result: ', result
    )

  update: (params) ->
    controller = this
    model = params.form.getRecord()

    params.form.submit(
      url: "/tags/#{model.data.id}.json"
      method: "PUT"
      success: ->
        console.log 'tag created successfully'
        controller.store.load()
        controller.index()
      failure: (form, result) ->
        console.log 'tag creation failed'
        console.log 'result: ', result
    )

  destroy: (params) ->
    controller = this
    model = params.form.getRecord()

    params.form.submit(
      url: "/tags/#{model.data.id}.json"
      method: "DELETE"
      success: ->
        console.log 'tag was successfully destroyed'
        controller.store.load()
        controller.index()
      failure: (form, result) ->
        console.log 'tag destruction failed'
    )
