Ext.regController 'Tags'
  store: App.stores.tags

  newForm:() ->
    model = new App.models.Tag()
    # Load the new model into the form
    # ...
    # Reveal the form:
    menucard = App.views.viewport.getComponent("menuCardPanel")
    packet = menucard.getComponent("tagsPacket")
    packet.setActiveItem('tagsForm')

