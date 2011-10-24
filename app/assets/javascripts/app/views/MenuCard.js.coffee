Ext.define 'App.views.MenuCard',
  extend: 'Ext.TabPanel'

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
          title:    'home'
        }
        {
          xtype:    'App.views.TasksPacket'
          id:       'tasksPacket'
          title:    'tasks'
          iconCls:  'check1'
        }
        {
          xtype:    'App.views.TagsPacket'
          id:       'tagsPacket'
          title:    'tags'
          iconCls:  'tag'
        }
        {
          xtype: 'panel'
          title: 'profile'
          iconCls: 'user'
        }
      ]

    App.views.MenuCard.superclass.initComponent.call(this)

  reveal: (target) ->
    @setActiveItem target,
      { type: 'slide', duration: 500 }

