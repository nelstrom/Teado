new Ext.Application({
    name: "App",
    defaultUrl   : 'login',

    launch: function() {
        this.views.viewport = new this.views.Viewport();
    }
});
