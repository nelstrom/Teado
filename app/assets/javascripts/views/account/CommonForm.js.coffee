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
      handler: => @onSaveAction()
      scope: this

    Ext.apply this,
      scroll: 'vertical'
      items: [ fields, saveButton ]

    App.views.CommonForm.superclass.initComponent.call(this)

  onSaveAction: ->
    Ext.dispatch
      controller : 'userSession'
      action     : 'create'
      form       : this

  showErrors: (object) ->
    fieldset = @down("##{@slug}FormFieldset")
    fieldset.setInstructions(object.message)

  resetForm: ->
    fieldset = @down("##{@slug}FormFieldset")
    fieldset.setInstructions(@defaultInstructions)
    @setLoading(false)
    @reset()

Ext.reg('App.views.CommonForm', App.views.CommonForm)
