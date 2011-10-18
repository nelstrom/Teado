App.views.TasksForm = Ext.extend Ext.form.FormPanel,
  initComponent: ->
    cancelButton =
      text: 'cancel'
      ui: 'back'
      handler: this.onCancelAction
      scope: this

    titlebar =
      id: 'taskFormTitlebar'
      xtype: 'toolbar'
      title: 'Create task'
      items: [ cancelButton ]

    taskfields =
      xtype: 'fieldset'
      title: 'Task'
      items: [
        {
          xtype: 'textfield'
          name : 'task[name]'
          label: 'name'
        },
        {
          xtype: 'selectfield'
          id: 'tasksFormBucketSelect'
          name : 'task[bucket]'
          label: 'due'
          store: App.stores.taskbuckets
        }
      ]

    tagfields =
      xtype: 'fieldset'
      id: 'taskFormTagfields'
      title: 'Tag it'
      defaults: { xtype: 'checkboxfield', name: 'task[tag_ids][]' }

    saveButton =
      id: 'taskFormSaveButton'
      xtype: 'button'
      ui: 'confirm'
      text: 'save'
      handler: @onSaveAction
      scope: this

    deleteButton =
      id: 'taskFormDeleteButton'
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
      url: '/tasks.json'
      dockedItems: [ titlebar, buttonbar ]
      items: [ taskfields, tagfields ]
      listeners:
        beforeactivate: ->
          deleteButton = @down('#taskFormDeleteButton')
          saveButton = @down('#taskFormSaveButton')
          titlebar = @down('#taskFormTitlebar')
          model = @getRecord()

          @buildTagCheckboxes()
          if model.phantom
            titlebar.setTitle('Create task')
            saveButton.setText('create')
            deleteButton.hide()
          else
            titlebar.setTitle('Update task')
            saveButton.setText('update')
            deleteButton.show()

        deactivate: -> @resetForm()

    App.views.TasksForm.superclass.initComponent.call(this)

  loadRecord: (instance) ->
    App.views.TasksForm.superclass.loadRecord.call(this, instance)

    if (instance && instance.data)
      namespacedData = {}
      for key of instance.data
        namespacedData["task[#{key}]"] = instance.data[key]

      @setValues(namespacedData)
      @record = instance

    return this

  onSaveAction: ->
    button = @down('#taskFormSaveButton')
    Ext.dispatch
      controller : 'Tasks'
      action     : button.getText()
      form       : this

  onCancelAction: ->
    Ext.dispatch
      controller : 'Tasks'
      action     : 'index'

  onDeleteAction: ->
    Ext.dispatch
      controller : 'Tasks'
      action     : 'destroy'
      form       : this

  resetForm: -> @reset()

  buildTagCheckboxes: ->
    model = @getRecord()
    fieldset = App.views.viewport.down('#taskFormTagfields')
    tags = App.stores.tags.data.items

    if tags.length == 0
      fieldset.hide()
    else
      fieldset.removeAll()
      for item in tags
        fieldset.add(
          value: item.data.id
          label: item.data.name
          checked: model.isTaggedAs(item.data.name)
        )
      fieldset.show()
      fieldset.doLayout()

Ext.reg('App.views.TasksForm', App.views.TasksForm)
