Ext.define 'App.views.Dashboard',
  extend: "Ext.Panel"

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
    currentUserStore = Ext.getStore('App.stores.currentUser')
    if currentUser = currentUserStore.first()
      @update(currentUser.data)


