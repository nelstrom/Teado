App.views.TagsForm = Ext.extend Ext.form.FormPanel,

  initComponent: ->
    fields =
      xtype: 'fieldset'
      title: 'Tag'
      items: [
        {
          xtype: 'textfield'
          name : 'tag[name]'
          label: 'name'
        }
      ]

    saveButton =
      xtype: 'button'
      text: 'save'
      handler: => @submit()

    Ext.apply this,
      scroll: 'vertical'
      url: '/tags.json'
      items: [ fields, saveButton ]

    App.views.TagsForm.superclass.initComponent.call(this);

  onSaveAction: ->
    Ext.dispatch
      controller : 'Tags'
      action     : 'create'
      data       : @getValues()
      record     : @getRecord()
      form       : this

Ext.reg('App.views.TagsForm', App.views.TagsForm);
