App.views.Dashboard = Ext.extend Ext.Panel,

  initComponent: () ->

    titlebar =
      id: 'dashboardTitlebar'
      xtype: 'toolbar'
      title: 'Dashboard'
      items: []

    Ext.apply this,
      scroll: 'vertical'
      html: 'Dashboard overview of whatever'
      dockedItems: [ titlebar ]

    App.views.Dashboard.superclass.initComponent.call(this)

Ext.reg('App.views.Dashboard', App.views.Dashboard)
