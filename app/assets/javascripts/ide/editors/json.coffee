#= require templates/editors/json

window.createJsonEditor = (options, file) ->
  {panel} = options
  {contents, path} = file.attributes

  # See if this is the special config file
  projectConfig = path is "pixie.json"

  panel.find('form').hide()
  panel.find('.editor').remove()

  try
    data = JSON.parse(contents) || {}
  catch e
    console?.warn? e
    data = {}

  jsonEditor = $(JST["templates/editors/json"]()).appendTo(panel)

  propertyEditor = jsonEditor.find('table').propertyEditor(data)

  jsonEditor.bind 'save', ->
    jsonData = propertyEditor.getProps()

    dataString = JSON.stringify(jsonData, null, 2)

    file.set
      contents: dataString

    saveFile
      contents: dataString
      path: path
      success: ->
        jsonEditor.trigger "clean"

    # Propagate changes back to IDE
    if projectConfig
      window.loadProjectConfig()

  return jsonEditor
