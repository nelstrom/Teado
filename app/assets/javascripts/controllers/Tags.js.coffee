Ext.regController 'Tags'
  store: App.stores.tags

  index: ->
    menucard = App.views.viewport.getComponent("menuCardPanel")
    packet = menucard.getComponent("tagsPacket")
    form = packet.getComponent("tagsForm")

    packet.setActiveItem('tagsList')

  newForm:() ->
    model = new App.models.Tag()
    menucard = App.views.viewport.getComponent("menuCardPanel")
    packet = menucard.getComponent("tagsPacket")
    form = packet.getComponent("tagsForm")

    # Load the new model into the form:
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
