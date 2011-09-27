App.views.TagsForm = Ext.extend Ext.form.FormPanel,

  initComponent: ->
    cancelButton =
      text: 'cancel'
      ui: 'back'
      handler: this.onCancelAction
      scope: this

    titlebar =
      id: 'tagFormTitlebar'
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
      id: 'tagFormSaveButton'
      xtype: 'button'
      ui: 'confirm'
      text: 'save'
      handler: @onSaveAction
      scope: this

    deleteButton =
      id: 'tagFormDeleteButton'
      text: 'delete'
      ui: 'decline'
      handler: @onDeleteAction
      scope: this

    buttonbar =
      xtype: 'toolbar'
      dock: 'bottom'
      items: [deleteButton, {xtype: 'spacer'}, saveButton]

    Ext.apply this,
      scroll: 'vertical'
      url: '/tags.json'
      dockedItems: [ titlebar, buttonbar ]
      items: [ fields ]
      listeners:
        beforeactivate: ->
          deleteButton = @down('#tagFormDeleteButton')
          saveButton = @down('#tagFormSaveButton')
          titlebar = @down('#tagFormTitlebar')
          model = @getRecord()

          if model.phantom
            titlebar.setTitle('Create tag');
            saveButton.setText('create');
            deleteButton.hide();
          else
            titlebar.setTitle('Update tag');
            saveButton.setText('update');
            deleteButton.hide();

        deactivate: -> @resetForm()

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

  resetForm: -> @reset()

Ext.reg('App.views.TagsForm', App.views.TagsForm);
