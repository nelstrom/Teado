new Ext.Application
  name: 'App'
  # defaultUrl: 'dashboard'

  launch: ->
    this.views.viewport = new this.views.Viewport();
