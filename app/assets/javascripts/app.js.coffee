new Ext.Application
  name: 'App'
  defaultUrl: 'welcome'

  launch: ->
    this.views.viewport = new this.views.Viewport();
