App.views.LoginCard = Ext.extend Ext.Panel,
  layout: 'card',

  initComponent: ->

    toggleFormButton =
      id: 'loginCardToggleButton'
      handler: => @onFormToggle()

    titleBar =
      id: 'loginCardTitlebar'
      xtype: 'toolbar'
      items: [ {xtype: 'spacer'}, toggleFormButton ]

    Ext.apply this,
      dockedItems: [ titleBar ]
      items: [
        { xtype: 'App.views.LoginForm',   id: 'loginForm' }
        { xtype: 'App.views.SignupForm',  id: 'signupForm' }
      ]

      listeners:
        show: -> @drawToolbar()
        cardswitch: -> @drawToolbar()
        deactivate: ->
          @down('#loginForm').resetForm()
          @down('#signupForm').resetForm()

    App.views.LoginCard.superclass.initComponent.apply(this, arguments)

  onFormToggle: ->
    if @getActiveItem().id == 'loginForm'
      @setActiveItem 'signupForm',
        { type: 'slide', direction: 'right' }
    else
      @setActiveItem 'loginForm',
        { type: 'slide', direction: 'left' }

  drawToolbar: ->
    button = @down('#loginCardToggleButton')
    titlebar = @down('#loginCardTitlebar')
    if @getActiveItem().id == 'loginForm'
      button.setText 'Sign up'
      titlebar.setTitle 'Log in'
    else
      button.setText 'Log in'
      titlebar.setTitle 'Sign up'

Ext.reg('App.views.LoginCard', App.views.LoginCard)
