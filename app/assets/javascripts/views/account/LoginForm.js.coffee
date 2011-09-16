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
      items: [ fields, saveButton ]
      url: '/sessions.json'
      listeners:
        exception: (form, object) ->
          fieldset = this.down('#loginFormFieldset');
          fieldset.setInstructions(object.message);
        submit: (form, object) ->
          Ext.dispatch
            controller: 'welcome'
            action: 'index'
            historyUrl: 'welcome'

    App.views.LoginForm.superclass.initComponent.call(this)

Ext.reg('App.views.LoginForm', App.views.LoginForm)
