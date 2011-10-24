Ext.define 'App.views.TasksList'
  extend: 'Ext.Panel'
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
        '<div class="checkitem {[values.done_at ? "done" : ""]}">&nbsp;</div>'
        # FIXME: instead of calling `values.done_at`, use `record.isDone()`
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
      Ext.dispatch(
        controller: 'Tasks'
        action: 'toggleDone'
        index: index
      )
    else
      Ext.dispatch(
        controller: 'Tasks'
        action: 'editForm'
        index: index
      )
