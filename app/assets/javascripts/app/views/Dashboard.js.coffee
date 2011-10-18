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
        beforeactivate: -> @displayWelcomeMessage()

    App.views.Dashboard.superclass.initComponent.call(this)

  displayWelcomeMessage: () ->
    if currentUser = App.stores.currentUser.first()
      @update(currentUser.data)


Ext.reg('App.views.Dashboard', App.views.Dashboard)
