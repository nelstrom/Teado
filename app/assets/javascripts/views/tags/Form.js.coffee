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
        beforesubmit: (form, values, options) ->
          # TODO: delete this (checking things still work)
          form.setValues(
            tag: values
          )
          window.form = form
          console.log "#beforesubmit form: ", form

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
            deleteButton.show();

        deactivate: -> @resetForm()

    App.views.TagsForm.superclass.initComponent.call(this);

  loadRecord: (instance) ->
    App.views.TagsForm.superclass.loadRecord.call(this, instance);

    if (instance && instance.data)
      namespacedData = {}
      for key of instance.data
        namespacedData["tag[#{key}]"] = instance.data[key]

      @setValues(namespacedData)
      @record = instance

    return this;


  onSaveAction: ->
    button = @down('#tagFormSaveButton')
    Ext.dispatch
      controller : 'Tags'
      action     : button.getText()
      form       : this

  onCancelAction: ->
    Ext.dispatch
      controller : 'Tags'
      action     : 'index'

  onDeleteAction: ->
    Ext.dispatch
      controller : 'Tags'
      action     : 'destroy'
      form       : this

  resetForm: -> @reset()

Ext.reg('App.views.TagsForm', App.views.TagsForm)
