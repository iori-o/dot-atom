# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)

# Fix Scrollbar issue
# Source: http://discuss.atom.io/t/ugly-scrollbars-bug/1027/11?u=jpsirois
atom.workspaceView.eachEditorView ->
  el = document.getElementsByClassName("workspace")[0]
  el.style.display = "inline-block"
  setTimeout( ->
    el.style.display = "block"
  , 50)

# Add theme detection onload to applied custom CSS based on current theme
atom.workspaceView.eachEditorView ->
  uiTheme = atom.config.settings.core.themes
  view    = atom.workspaceView[0]
  uiTheme.forEach (el) ->
    view.className = view.className.replace(' ' + el, '') + " " + el

process.env.PATH = ["/tmp/bin", process.env.PATH].join(":")
