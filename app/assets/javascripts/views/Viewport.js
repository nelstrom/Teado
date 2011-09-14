App.views.Viewport = Ext.extend(Ext.Panel, {
    fullscreen: true,
    layout: 'card',
    
    initComponent: function() {
        Ext.apply(this, {
            items: [
                { xtype: 'App.views.Welcome',    id: 'welcomePanel' },
                { xtype: 'App.views.LoginForm',  id: 'loginForm' },
                { xtype: 'App.views.SignupForm', id: 'signupForm' },
            ]
        });
        App.views.Viewport.superclass.initComponent.apply(this, arguments);
    },

    reveal: function(target) {
        var direction = (target === 'usersList') ? 'right' : 'left'
        this.setActiveItem(
            App.views[target],
            { type: 'slide', direction: direction }
        );
    }
});
