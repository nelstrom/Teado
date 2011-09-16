App.views.Dashboard = Ext.extend Ext.Panel,

  initComponent: () ->

    logoutButton =
      text: "Log out"
      handler: ->
        Ext.dispatch
          controller: 'login'
          action: 'logout'

    titlebar =
      id: 'dashboardTitlebar'
      xtype: 'toolbar'
      title: 'Dashboard'
      items: [ logoutButton ]

    Ext.apply this,
      scroll: 'vertical'
      html: 'Dashboard overview of whatever'
      dockedItems: [ titlebar ]

    App.views.Dashboard.superclass.initComponent.call(this)

Ext.reg('App.views.Dashboard', App.views.Dashboard)
