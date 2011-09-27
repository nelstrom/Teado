Ext.regController 'Tags'
  store: App.stores.tags

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
    params.form.submit(
      success: -> console.log 'tag created successfully'
      failure: -> console.log 'tag creation failed'
    )
