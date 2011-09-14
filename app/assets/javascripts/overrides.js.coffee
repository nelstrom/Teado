Ext.Ajax.on 'beforerequest',
  (conn, options) ->
    console.log 'AJAX - before request: ', options
    metatag = Ext.select('meta[name="csrf-token"]')
    content = metatag.getValue("content")
    options.headers["X-CSRF-Token"] = content.elements[0].content
  this
