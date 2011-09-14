App.views.LoginForm = Ext.extend Ext.form.FormPanel,

  initComponent: () ->

    fields =
      xtype: 'fieldset'
      id: 'loginFormFieldset'
      title: 'Log in'
      instructions: 'Enter your username (or email address) and password to log in'
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
          name: 'password'
          label: 'password'
          xtype: 'passwordfield'
        }
      ]

    saveButton =
      xtype: 'button'
      text: 'log in'
      handler: -> this.submit()
      scope: this

    Ext.apply this,
      scroll: 'vertical'
      url: '/sessions.json'
      items: [ fields, saveButton ]
      listeners:
        submit: (form, object) ->
          fieldset = this.down('#loginFormFieldset');
          fieldset.setInstructions('You have successfully logged in!');
          App.views.viewport.setActiveItem('welcomePanel')
        exception: (form, object) ->
          fieldset = this.down('#loginFormFieldset');
          fieldset.setInstructions(object.message);

    App.views.LoginForm.superclass.initComponent.call(this)

Ext.reg('App.views.LoginForm', App.views.LoginForm)
