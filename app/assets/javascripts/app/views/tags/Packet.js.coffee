Ext.define 'App.views.TagsPacket'
  extend: 'Ext.Panel'

  initComponent: ->
    Ext.apply this,
      layout: 'card'
      items: [
        { xtype: 'App.views.TagsList', id: 'tagsList' }
        { xtype: 'App.views.TagsForm', id: 'tagsForm' }
      ]
    App.views.TagsPacket.superclass.initComponent.call(this)
