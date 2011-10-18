App.views.TagsList = Ext.extend Ext.Panel,
  initComponent: ->
    addButton =
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
      listeners:
        scope: this
        itemtap: @onItemtapAction

    Ext.apply this,
      layout: 'fit'
      dockedItems: [ titleBar ]
      items: [list]
    App.views.TagsList.superclass.initComponent.call(this)

  onAddAction: ->
    Ext.dispatch
      controller: 'Tags'
      action: 'newForm'

  onItemtapAction: (list, index, item, e) ->
    Ext.dispatch(
      controller: 'Tags'
      action: 'editForm'
      index: index
    )

Ext.reg('App.views.TagsList', App.views.TagsList)
