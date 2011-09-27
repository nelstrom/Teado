App.views.TasksList = Ext.extend Ext.Panel,
  initComponent: ->
    addButton =
      iconCls: 'add'
      iconMask: true
      ui: 'plain'
      handler: @onAddAction
      scope: this

    titleBar =
      xtype: 'toolbar'
      title: 'Tags'
      items: [ {xtype: 'spacer'}, addButton ]

    list =
      xtype: 'list'
      itemTpl: '{name}'
      store: App.stores.tasks

    Ext.apply this,
      layout: 'fit'
      items: [list]
      dockedItems: [ titleBar ]

    App.views.TasksList.superclass.initComponent.call(this)

Ext.reg('App.views.TasksList', App.views.TasksList)
