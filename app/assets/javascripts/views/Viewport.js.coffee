App.views.Viewport = Ext.extend Ext.Panel,
  fullscreen: true
  layout: 'card'

  initComponent: ->
    Ext.apply this,
      items: [
        { xtype: 'App.views.Dashboard',  id: 'dashboardPanel' }
        { xtype: 'App.views.LoginCard',  id: 'loginCardPanel' }
      ]
      listeners:
        afterlayout: ->
          console.log 'post layout...'
          @setActiveItem 'loginCardPanel',
            { type: 'slide', direction: 'up', duration: 500 }

    App.views.Viewport.superclass.initComponent.apply(this, arguments)
