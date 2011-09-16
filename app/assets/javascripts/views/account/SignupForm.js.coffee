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

    saveButton =
      xtype: 'button'
      text: 'Create your new account'
      handler: -> @submit()
      scope: this

    Ext.apply this,
      scroll: 'vertical'
      url: '/users.json'
      items: [ fields, saveButton ]
      listeners:
        exception: (form, object) ->
          fieldset = @down('#signupFormFieldset');
          fieldset.setInstructions(object.message);
        submit: (form, object) ->
          Ext.dispatch
            controller: 'welcome'
            action: 'index'
            historyUrl: 'welcome'

    App.views.SignupForm.superclass.initComponent.call(this)

  resetForm: -> @reset()

Ext.reg('App.views.SignupForm', App.views.SignupForm)
