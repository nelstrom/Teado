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
          # name : 'name'
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
            deleteButton.hide();

        deactivate: -> @resetForm()

    App.views.TagsForm.superclass.initComponent.call(this);

  loadRecord: (instance, prefix, suffix) ->
    console.log 'overriding loadRecord...'
    # prefix ||= "tags["
    # suffix ||= "]"
    window.data = instance.data
    # {id: 3, name: "cookery"}
    # =>
    # { tag[id]: 3, tag[name]: "cookery" }
    console.log "instance.data: ", instance.data
    namespacedData = {}
    for key of instance.data
      console.log key
      namespacedData["tag[#{key}]"] = instance.data[key]
    console.log "namespacedData: ", namespacedData

    if (instance && instance.data)
      @setValues(namespacedData)
      # @setValues( {"tag[name]": 'it works!'} )  # <- this works!
      # @setValues( {tag: {name: 'it works!'}} )  # <- this doesn't work!
      @record = instance
    return this;

    # the code that we are overriding
    if (instance && instance.data)
      @setValues(instance.data)
      @record = instance
    return this;
    # App.views.TagsForm.superclass.loadRecord.call(this, instance);

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
