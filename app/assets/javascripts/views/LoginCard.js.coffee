App.views.LoginCard = Ext.extend Ext.Panel,
  layout: 'card',
  
  initComponent: () ->

    toggleFormButton = 
      id: 'loginCardToggleButton'
      text: 'Sign up'
      handler: => @onFormToggle()

    titleBar = 
      id: 'loginCardTitlebar'
      xtype: 'toolbar'
      title: 'Log in'
      items: [ {xtype: 'spacer'}, toggleFormButton ]

    Ext.apply this,
      items: [
        { xtype: 'App.views.LoginForm',   id: 'loginForm' }
        { xtype: 'App.views.SignupForm',  id: 'signupForm' }
      ]
      dockedItems: [ titleBar ]

    App.views.LoginCard.superclass.initComponent.apply(this, arguments)

  onFormToggle: () ->
    button = this.down('#loginCardToggleButton')
    titlebar = this.down('#loginCardTitlebar')
    if button.getText() == 'Sign up'
      button.setText 'Log in'
      titlebar.setTitle 'Sign up'
      @setActiveItem('signupForm')
    else
      button.setText 'Sign up'
      titlebar.setTitle 'Log in'
      @setActiveItem('loginForm')

Ext.reg('App.views.LoginCard', App.views.LoginCard)
