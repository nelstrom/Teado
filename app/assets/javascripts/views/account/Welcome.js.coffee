App.views.Welcome = Ext.extend Ext.Panel,
  initComponent: () ->

    titlebar =
      id: 'welcomeTitlebar'
      xtype: 'toolbar'
      title: 'Welcome!'
      items: []

    Ext.apply this,
      scroll: 'vertical'
      html: 'welcome message'
      dockedItems: [ titlebar ]

    App.views.Welcome.superclass.initComponent.call(this)

Ext.reg('App.views.Welcome', App.views.Welcome)
