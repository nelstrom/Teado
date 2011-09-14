App.views.LoginCard = Ext.extend Ext.Panel,
  layout: 'card',
  
  initComponent: () ->

    toggleFormButton = 
      text: 'Sign up'
      handler: ->
        if @getText() == 'Sign up'
          @setText 'Log in'
        else
          @setText 'Sign up'

    titleBar = 
      xtype: 'toolbar'
      title: 'Log in'
      items: [ {xtype: 'spacer'}, toggleFormButton ]

    Ext.apply this,
      items: [
        { xtype: 'App.views.LoginForm',   id: 'loginForm' }
        { xtype: 'App.views.SignupForm',  id: 'signupForm' }
      ]
      dockedItems: [ titleBar ]

    App.views.LoginCard.superclass.initComponent.apply(this, arguments);
  

Ext.reg('App.views.LoginCard', App.views.LoginCard)
