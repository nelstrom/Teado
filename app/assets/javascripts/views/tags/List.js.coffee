App.views.TagsList = Ext.extend Ext.Panel,

  initComponent: ->
    addButton =
      itemId: 'addButton'
      iconCls: 'add'
      iconMask: true
      ui: 'plain'
      handler: this.onAddAction
      scope: this

    titleBar =
      xtype: 'toolbar'
      title: 'Tags'
      items: [ {xtype: 'spacer'}, addButton ]

    list =
      xtype: 'list'
      itemTpl: '{name}'
      store: App.stores.tags

    Ext.apply this,
      layout: 'fit'
      dockedItems: [ titleBar ]
      items: [list]
    App.views.TagsList.superclass.initComponent.call(this)

  onAddAction: ->
    Ext.dispatch
      controller: 'Tags'
      action: 'newForm'

Ext.reg('App.views.TagsList', App.views.TagsList)
