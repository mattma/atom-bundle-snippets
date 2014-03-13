{View} = require 'atom'

module.exports =
class AtomBundleSnippetsView extends View
  @content: ->
    @div class: 'atom-bundle-snippets overlay from-top', =>
      @div "The AtomBundleSnippets package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "atom-bundle-snippets:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "AtomBundleSnippetsView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
