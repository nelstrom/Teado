App.views.TagsList = Ext.extend Ext.Panel,

  initComponent: ->
    titleBar =
      xtype: 'toolbar'
      title: 'Tags'

    list =
      xtype: 'list'
      itemTpl: '{name}'
      store: App.stores.tags

    Ext.apply this,
      layout: 'fit'
      dockedItems: [ titleBar ]
      items: [list]
    App.views.TagsList.superclass.initComponent.call(this)

Ext.reg('App.views.TagsList', App.views.TagsList)
