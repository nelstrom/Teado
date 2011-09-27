App.views.TagsForm = Ext.extend Ext.form.FormPanel,

  initComponent: ->
    cancelButton =
      text: 'cancel'
      ui: 'back'
      handler: this.onCancelAction
      scope: this

    titlebar =
      id: 'tagsFormTitlebar'
      xtype: 'toolbar'
      title: 'Create tag'
      items: [ cancelButton ]

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
      handler: @onSaveAction
      scope: this

    Ext.apply this,
      scroll: 'vertical'
      url: '/tags.json'
      dockedItems: [ titlebar ]
      items: [ fields, saveButton ]

    App.views.TagsForm.superclass.initComponent.call(this);

  onSaveAction: ->
    Ext.dispatch
      controller : 'Tags'
      action     : 'create'
      form       : this

  onCancelAction: ->
    Ext.dispatch
      controller : 'Tags'
      action     : 'index'

Ext.reg('App.views.TagsForm', App.views.TagsForm);
