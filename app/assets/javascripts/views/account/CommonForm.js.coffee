App.views.CommonForm = Ext.extend Ext.form.FormPanel,

  defaultInstructions: 'Enter your username (or email address) and password to log in'
  initComponent: () ->
    pane = this

    fields =
      xtype: 'fieldset'
      id: pane.slug + 'FormFieldset'
      title: pane.fieldsetTitle
      instructions: pane.defaultInstructions
      defaults:
        xtype: 'textfield'
        required: false
        autoCapitalize : false
      items: pane.formFields

    saveButton =
      xtype: 'button'
      text: pane.buttonText
      handler: => @submit()

    Ext.apply this,
      scroll: 'vertical'
      items: [ fields, saveButton ]
      listeners:
        exception: (form, object) ->
          fieldset = @down("##{pane.slug}FormFieldset")
          fieldset.setInstructions(object.message)
        submit: (form, object) ->
          @setLoading(true)
          Ext.dispatch
            controller: 'welcome'
            action: 'index'
            historyUrl: 'welcome'

    App.views.CommonForm.superclass.initComponent.call(this)

  resetForm: ->
    fieldset = @down("##{this.slug}FormFieldset")
    fieldset.setInstructions(@defaultInstructions)
    @setLoading(false)
    @reset()

Ext.reg('App.views.CommonForm', App.views.CommonForm)
