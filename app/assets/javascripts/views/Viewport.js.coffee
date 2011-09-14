App.views.Viewport = Ext.extend Ext.Panel,
  fullscreen: true
  layout: 'card'

  initComponent: () ->
    Ext.apply this,
      items: [
        { xtype: 'App.views.Dashboard',  id: 'dashboardPanel' }
        { xtype: 'App.views.LoginCard',  id: 'loginCardPanel' }
      ]

    App.views.Viewport.superclass.initComponent.apply(this, arguments)
