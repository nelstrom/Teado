Ext.define 'App.views.TasksPacket'
  extend: 'Ext.Panel'

  initComponent: ->
    Ext.apply this,
      layout: 'card'
      items: [
        { xtype: 'App.views.TasksList', id: 'tasksList' }
        { xtype: 'App.views.TasksForm', id: 'tasksForm' }
      ]
    App.views.TasksPacket.superclass.initComponent.call(this)
