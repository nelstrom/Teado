Ext.Ajax.on 'beforerequest',
  (conn, options) ->
    console.log 'AJAX - before request: ', options
    options.headers["X-CSRF-Token"] = 'tWqi23QtwKAt2oigt5Se7+hxrbgIotYDb4sq76QnXw8='
  this
