App.views.TasksList = Ext.extend Ext.Panel,
  initComponent: ->
    addButton =
      iconCls: 'add'
      iconMask: true
      ui: 'plain'
      handler: this.onAddAction
      scope: this

    titleBar =
      xtype: 'toolbar'
      title: 'Tasks'
      items: [ {xtype: 'spacer'}, addButton ]

    list =
      xtype: 'list'
      itemTpl: '{name}'
      store: App.stores.tasks

    Ext.apply this,
      layout: 'fit'
      dockedItems: [ titleBar ]
      items: [list]
    App.views.TasksList.superclass.initComponent.call(this)

  onAddAction: ->
    Ext.dispatch
      controller: 'Tasks'
      action: 'newForm'

Ext.reg('App.views.TasksList', App.views.TasksList)
