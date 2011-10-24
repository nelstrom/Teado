Ext.define 'App.views.LoginForm'
  extend: 'App.views.CommonForm'

  initComponent: ->

    Ext.apply this,
      slug: 'login'
      url: '/sessions.json'
      fieldsetTitle: 'Log in'
      buttonText: 'Log in'
      formFields: [
        {
          name : 'username'
          label: 'username'
        }
        {
          name: 'password'
          label: 'password'
          xtype: 'passwordfield'
        }
      ]
      defaultInstructions: 'Enter your username (or email address) and password to log in'

    App.views.LoginForm.superclass.initComponent.call(this)

