App.views.LoginForm = Ext.extend Ext.form.FormPanel,

    initComponent: () ->
        titlebar =
            id: 'loginFormTitlebar'
            xtype: 'toolbar'
            title: 'Log in'
            items: []

        fields =
            xtype: 'fieldset'
            id: 'loginFormFieldset'
            title: 'Log in'
            instructions: 'Enter your username (or email address) and password to log in'
            defaults:
                xtype: 'textfield'
                required: false
                autoCapitalize : false
            items: [
                {
                    name : 'username'
                    label: 'username'
                }
                {
                    name: 'password'
                    label: 'password'
                    xtype: 'passwordfield'
                }
            ]

        Ext.apply this,
            scroll: 'vertical'
            dockedItems: [ titlebar ]
            items: [ fields ]
            listeners:
                deactivate: () -> this.resetForm()

        App.views.LoginForm.superclass.initComponent.call(this)

Ext.reg('App.views.LoginForm', App.views.LoginForm)
