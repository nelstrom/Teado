App.views.Viewport = Ext.extend Ext.Panel,
  fullscreen: true
  layout: 'card'

  initComponent: ->
    Ext.apply this,
      items: [
        { xtype: 'App.views.MenuCard',  id: 'menuCardPanel' }
        { xtype: 'App.views.LoginCard',  id: 'loginCardPanel' }
      ]

    App.views.Viewport.superclass.initComponent.apply(this, arguments)

  reveal: (target) ->
    direction = (target == 'loginCardPanel') ? 'up' : 'down'
    @setActiveItem target,
      { type: 'slide', direction: direction, duration: 500 }

