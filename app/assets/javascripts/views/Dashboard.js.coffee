App.views.Dashboard = Ext.extend Ext.Panel,

  initComponent: () ->

    logoutButton =
      text: "Log out"
      handler: =>
        Ext.dispatch
          controller: 'userSession'
          action: 'destroy'

    titlebar =
      id: 'dashboardTitlebar'
      xtype: 'toolbar'
      title: 'Dashboard'
      items: [ {xtype: 'spacer'}, logoutButton ]

    Ext.apply this,
      scroll: 'vertical'
      html: 'Dashboard overview of whatever'
      dockedItems: [ titlebar ]

    App.views.Dashboard.superclass.initComponent.call(this)

Ext.reg('App.views.Dashboard', App.views.Dashboard)
