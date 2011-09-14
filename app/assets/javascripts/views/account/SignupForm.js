App.views.SignupForm = Ext.extend(Ext.form.FormPanel, {

    initComponent: function(){
        var cancelButton, buttonbar, saveButton, deleteButton, fields;

        fields = {
            xtype: 'fieldset',
            id: 'signupFormFieldset',
            title: 'User details',
            instructions: this.defaultInstructions,
            defaults: {
                xtype: 'textfield',
                labelAlign: 'left',
                labelWidth: '40%',
                required: false,
                useClearIcon: true,
                autoCapitalize : false
            },
            items: [
                {
                    name : 'username',
                    label: 'username',
                },
                {
                    name : 'email',
                    label: 'email',
                },
                {
                    name: 'password',
                    label: 'password',
                    xtype: 'passwordfield',
                },
            ]
        };

        Ext.apply(this, {
            scroll: 'vertical',
            items: [ fields ]
        });

        App.views.SignupForm.superclass.initComponent.call(this);
    },


});

Ext.reg('App.views.SignupForm', App.views.SignupForm);
