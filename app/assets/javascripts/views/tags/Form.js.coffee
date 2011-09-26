App.views.TagsForm = Ext.extend Ext.form.FormPanel,

  initComponent: ->
    fields =
      xtype: 'fieldset'
      title: 'Tag'
      items: [
        {
          xtype: 'textfield'
          name : 'name'
          label: 'name'
        }
      ]

    Ext.apply this,
      scroll: 'vertical'
      items: [ fields ]

    App.views.TagsForm.superclass.initComponent.call(this);

Ext.reg('App.views.TagsForm', App.views.TagsForm);
