module.exports =
  activate: (state) ->
    require('atom-package-deps').install('tool-bar-main')
    require('atom-package-deps').install('open-on-github')
    require('atom-package-deps').install('git-control')
    require('atom-package-deps').install('merge-conflicts')
    # require('atom-package-deps').install('git-time-machine')
    require('atom-package-deps').install('terminal-plus')
    # require('atom-package-deps').install('ask-stack')
    # require('atom-package-deps').install('atom-beautify')
    # require('atom-package-deps').install('recent-finder')
    # require('atom-package-deps').install('tree-view')
    require('atom-package-deps').install('git-history')
    require('atom-package-deps').install('split-diff')

  deactivate: ->
    @toolBar?.removeItems()

  serialize: ->

  consumeToolBar: (toolBar) ->
    @toolBar = toolBar 'main-tool-bar'

    @toolBar.addButton
      tooltip: 'Tree-View'
      callback: 'tree-view:toggle'
      icon: 'repo'

    # @toolBar.addButton
    #   tooltip: 'New File'
    #   callback: 'application:new-file'
    #   icon: 'document-text'
    #   iconset: 'ion'

    @toolBar.addButton
      tooltip: 'Find and Replace'
      callback: 'project-find:show-in-current-directory'
      icon: 'search'
      iconset: 'fa'

    # @toolBar.addButton
    #   tooltip: 'Open Folder'
    #   callback: 'application:open-folder'
    #   icon: 'folder'
    #   iconset: 'ion'

    # @toolBar.addButton
    #   tooltip: 'Save all'
    #   callback: 'window:save-all'
    #   icon: 'archive'
    #   iconset: 'ion'

    # @toolBar.addButton
    #   tooltip: 'Open recent files'
    #   dependency: 'recent-finder'
    #   callback: 'recent-finder:toggle'
    #   icon: 'file-submodule'

    @toolBar.addSpacer()

    @toolBar.addButton
      tooltip: 'Git Control'
      dependency: 'git-control'
      callback: 'git-control:toggle'
      icon: 'git-plain'
      iconset: 'devicon'

    @toolBar.addButton
      tooltip: 'Merge Conflicts'
      dependency: 'merge-conflicts'
      callback: 'merge-conflicts:detect'
      icon: 'git-merge'
    #   icon: 'code-fork'
    #   iconset: 'fa'

    @toolBar.addButton
      tooltip: 'Git History'
      dependency: [
          'git-history',
          'split-diff'
      ]
      callback: ->
          editorElement = atom.views.getView(atom.workspace.getActiveTextEditor())
        #   atom.commands.onDidDispatch((event) ->
        #         atom.commands.onDidDispatch()
        #         atom.commands.dispatch(editorElement, 'splite-diff:toggle')
        #     )
          atom.commands.dispatch(editorElement, 'git-history:show-file-history')
        #   'git-history:show-file-history'
      icon: 'history'

    @toolBar.addButton
      tooltip: 'Open on Github'
      dependency: 'open-on-github'
      callback: 'open-on-github:file'
      icon: 'octoface'

    # @toolBar.addButton
    #   tooltip: 'git-time-machine'
    #   dependency: 'git-time-machine'
    #   callback: 'git-time-machine:toggle'
    #   icon: 'map'
    #   iconset: 'ion'

    @toolBar.addSpacer()

    @toolBar.addButton
      tooltip: 'Terminal'
      dependency: 'terminal-plus'
      callback: 'terminal-plus:toggle'
      icon: 'terminal'
      iconset: 'fa'

    # @toolBar.addButton
    #   icon: "question"
    #   dependency: 'ask-stack'
    #   callback: "ask-stack:ask-question"
    #   tooltip: "ask stackoverflow"

    # @toolBar.addButton
    #   tooltip: 'Auto indent'
    #   dependency: 'atom-beautify'
    #   callback: 'atom-beautify:beautify-editor'
    #   icon: 'indent'
    #   iconset: 'fa'

    # @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'gear-a'
      callback: 'settings-view:open'
      tooltip: 'Open Settings View'
      iconset: 'ion'

    if atom.inDevMode()
      @toolBar.addSpacer()

      @toolBar.addButton
        icon: 'refresh'
        callback: 'window:reload'
        tooltip: 'Reload Window'
        iconset: 'ion'
      @toolBar.addButton
        icon: 'terminal'
        callback: ->
          require('remote').getCurrentWindow().toggleDevTools()
        tooltip: 'Toggle Developer Tools'
