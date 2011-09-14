new Ext.Application
  name: 'App'
  defaultUrl: 'login'

  launch: ->
    this.views.viewport = new this.views.Viewport();
