Ext.define 'App.views.SignupForm'
  extend: 'App.views.CommonForm'

  initComponent: ->

    Ext.apply this,
      slug: 'signup'
      url: '/users.json'
      fieldsetTitle: 'Sign up'
      buttonText: 'Create your new account'
      formFields: [
        {
          name : 'user[username]'
          label: 'username'
        }
        {
          name : 'user[email]'
          label: 'email'
        }
        {
          name: 'user[password]'
          label: 'password'
          xtype: 'passwordfield'
        }
      ]
      defaultInstructions: 'To sign up, simply choose your username and password, and provide your email address.'

    App.views.SignupForm.superclass.initComponent.call(this)
