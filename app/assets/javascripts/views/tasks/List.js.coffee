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
      itemTpl: [
        '{name}'
        '<div class="checkitem">{[values.done_at ? "X" : "-"]}</div>'
      ]
      store: App.stores.tasks
      listeners:
        scope: this
        itemtap: @onItemtapAction

    Ext.apply this,
      layout: 'fit'
      dockedItems: [ titleBar ]
      items: [list]
    App.views.TasksList.superclass.initComponent.call(this)

  onAddAction: ->
    Ext.dispatch
      controller: 'Tasks'
      action: 'newForm'

  onItemtapAction: (list, index, item, e) ->
    if e.getTarget('.checkitem')
      console.log 'checkitem was tapped'
    else
      console.log 'checkitem was not tapped'
      Ext.dispatch(
        controller: 'Tasks'
        action: 'editForm'
        index: index
      )

Ext.reg('App.views.TasksList', App.views.TasksList)
