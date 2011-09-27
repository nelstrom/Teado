App.views.TasksForm = Ext.extend Ext.form.FormPanel,
  initComponent: ->
    App.views.TasksForm.superclass.initComponent.call(this);

Ext.reg('App.views.TasksForm', App.views.TasksForm);
