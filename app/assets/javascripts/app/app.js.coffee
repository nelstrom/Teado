Ext.Application
  name: 'App'
  # defaultUrl: 'dashboard'
  models: [
    'App.models.Tag'
    'App.models.CurrentUser'
    'App.models.Task'
    'App.models.TaskBucket'
    'App.models.User'
  ]
  controllers: [
    'App.controllers.dashboard'
    'App.controllers.userSession'
    'App.controllers.Tags'
    'App.controllers.Tasks'
    'App.controllers.Users'
  ]

  launch: ->
    this.views.viewport = new this.views.Viewport();
