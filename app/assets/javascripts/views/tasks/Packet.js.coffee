App.views.TasksPacket = Ext.extend Ext.Panel,

  initComponent: ->
    Ext.apply this,
      layout: 'card'
      items: [
        # { xtype: 'App.views.TasksList', id: 'tagsList' }
        # { xtype: 'App.views.TasksForm', id: 'tagsForm' }
      ]
    App.views.TasksPacket.superclass.initComponent.call(this)

Ext.reg('App.views.TasksPacket', App.views.TasksPacket)
