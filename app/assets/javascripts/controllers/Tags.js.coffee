Ext.regController 'Tags'
  store: App.stores.tags

  newForm:() ->
    model = new App.models.Tag()
    # Load the new model into the form:
    # ...
    # Reveal the form:
    menucard = App.views.viewport.getComponent("menuCardPanel")
    packet = menucard.getComponent("tagsPacket")
    form = packet.getComponent("tagsForm")

    form.load(model)
    packet.setActiveItem('tagsForm')

  create: (params) ->
    console.log 'creating a new tag...'
    window.debug = params.data
    console.log 'form data: ', params.data

    @store.add(params.data)
    @store.sync()
