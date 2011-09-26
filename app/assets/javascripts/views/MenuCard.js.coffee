App.views.MenuCard = Ext.extend Ext.TabPanel,

  initComponent: () ->

    Ext.apply this,
      tabBar:
        dock: 'bottom'
        layout: { pack: 'center' }

      items: [
        {
          xtype:    'App.views.Dashboard'
          id:       'dashboardPanel'
          iconCls:  'home'
        }
        {
          xtype:    'App.views.TagsPacket'
          id:       'tagsPacket'
          title:    'tags'
          iconCls:  'tags'
        }
        { xtype: 'panel', iconCls: 'tasks', title: 'tasks' }
        { xtype: 'panel', iconCls: 'profile', title: 'profile' }
      ]

    App.views.MenuCard.superclass.initComponent.call(this)

  reveal: (target) ->
    @setActiveItem target,
      { type: 'slide', duration: 500 }

Ext.reg('App.views.MenuCard', App.views.MenuCard)
