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
      tpl: 'Welcome, {username}!'
      styleHtmlContent: true
      dockedItems: [ titlebar ]
      listeners:
        beforeactivate: ->
          if currentUser = App.stores.currentUser.first()
            this.update(currentUser.data)

    App.views.Dashboard.superclass.initComponent.call(this)

Ext.reg('App.views.Dashboard', App.views.Dashboard)
