AtomBundleSnippets = require '../lib/atom-bundle-snippets'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AtomBundleSnippets", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('atomBundleSnippets')

  describe "when the atom-bundle-snippets:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.atom-bundle-snippets')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'atom-bundle-snippets:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.atom-bundle-snippets')).toExist()
        atom.workspaceView.trigger 'atom-bundle-snippets:toggle'
        expect(atom.workspaceView.find('.atom-bundle-snippets')).not.toExist()
