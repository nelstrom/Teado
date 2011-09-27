App.views.TasksList = Ext.extend Ext.Panel,
  initComponent: ->
    Ext.apply this,
      layout: 'fit'

    App.views.TasksList.superclass.initComponent.call(this)

Ext.reg('App.views.TasksList', App.views.TasksList)
