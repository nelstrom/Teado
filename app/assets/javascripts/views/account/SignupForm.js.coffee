App.views.SignupForm = Ext.extend Ext.form.FormPanel,

  initComponent: () ->

    fields =
      xtype: 'fieldset'
      id: 'signupFormFieldset'
      title: 'User details'
      instructions: 'To sign up, simply choose your username and password, and provide your email address.'
      defaults:
        xtype: 'textfield'
        required: false
        autoCapitalize : false
      items: [
        {
          name : 'username'
          label: 'username'
        }
        {
          name : 'email'
          label: 'email'
        }
        {
          name: 'password'
          label: 'password'
          xtype: 'passwordfield'
        }
      ]

    saveButton =
      xtype: 'button'
      text: 'Create your new account'
      handler: -> this.submit()
      scope: this

    Ext.apply this,
      scroll: 'vertical'
      url: '/users.json'
      items: [ fields, saveButton ]
      listeners:
        submit: (form, object) ->
          console.log 'creating a new user account...'

    App.views.SignupForm.superclass.initComponent.call(this)

Ext.reg('App.views.SignupForm', App.views.SignupForm)
