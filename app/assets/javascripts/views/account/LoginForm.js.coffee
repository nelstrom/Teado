App.views.LoginForm = Ext.extend Ext.form.FormPanel,

  defaultInstructions: 'Enter your username (or email address) and password to log in'
  initComponent: () ->

    fields =
      xtype: 'fieldset'
      id: 'loginFormFieldset'
      title: 'Log in'
      instructions: @defaultInstructions
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
      handler: => @submit()

    Ext.apply this,
      scroll: 'vertical'
      items: [ fields, saveButton ]
      url: '/sessions.json'
      listeners:
        exception: (form, object) ->
          fieldset = @down('#loginFormFieldset')
          fieldset.setInstructions(object.message)
        submit: (form, object) ->
          Ext.dispatch
            controller: 'welcome'
            action: 'index'
            historyUrl: 'welcome'

    App.views.LoginForm.superclass.initComponent.call(this)

  resetForm: ->
    fieldset = @down('#loginFormFieldset')
    fieldset.setInstructions(@defaultInstructions)
    @reset()

Ext.reg('App.views.LoginForm', App.views.LoginForm)
