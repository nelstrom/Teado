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

    fields =
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
          options: [
            { text: 'As soon as possible', value: 'asap' }
            { text: 'Today', value: 'due_today' }
            { text: 'Tomorrow', value: 'due_tomorrow' }
            { text: 'This week', value: 'due_this_week' }
            { text: 'Next week', value: 'due_next_week' }
            { text: 'Sometime later', value: 'due_later' }
            { text: 'Overdue', value: 'overdue' }
          ]
        }
      ]

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
      items: [ fields ]
      listeners:
        beforeactivate: ->
          deleteButton = @down('#taskFormDeleteButton')
          saveButton = @down('#taskFormSaveButton')
          titlebar = @down('#taskFormTitlebar')
          model = @getRecord()

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

Ext.reg('App.views.TasksForm', App.views.TasksForm)
