AtomBundleSnippetsView = require './atom-bundle-snippets-view'

module.exports =
  atomBundleSnippetsView: null

  activate: (state) ->
    @atomBundleSnippetsView = new AtomBundleSnippetsView(state.atomBundleSnippetsViewState)

  deactivate: ->
    @atomBundleSnippetsView.destroy()

  serialize: ->
    atomBundleSnippetsViewState: @atomBundleSnippetsView.serialize()
