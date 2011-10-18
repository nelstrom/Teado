Ext.Ajax.on 'beforerequest',
  (conn, options) ->
    metatag = Ext.select('meta[name="csrf-token"]')
    # console.log 'connection', conn
    # console.log 'options', options
    # console.log 'metatag', metatag
    # console.log 'metatag.first()', metatag.first()
    if metatag.first()?
      content = metatag.first().dom.content
      options.headers ||= {}
      options.headers["X-CSRF-Token"] = content
  this
