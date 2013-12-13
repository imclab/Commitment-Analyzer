window.CommitmentAnalyzer =
  modulesMatched: []
  elementsCount: 0
  selectedFramework: ''
  selectedFrameworkTotalModules: 0
  frameworks:
    bootstrap3:
      'alert': ['.alert','[class*="alert-"]']
      'badge': ['.badge']
      'breadcrumb': ['.breadcrumb']
      'btn-group' : ['.btn-group','.btn-group-vertical','.btn-toolbar','.btn-group-justified','.dropup']
      'btn': ['.btn','[class*="btn-"]']
      'carousel': ['.carousel','.carousel-inner']
      'close': ['.close']
      'code': ['.pre-scrollable']
      'component-animations': ['.fade','.collapse','.collapsing']
      'dropdowns': ['.caret','.dropdown','.dropdown-toggle','.dropdown-menu','.dropdown-header','.dropdown-backdrop']
      'form': ['.control-label','.checkbox','.checkbox-inline','.form-control','.form-control-static','.form-horizontal','.form-inline','.form-group','.has-warning','.has-error','.has-success','.help-block','.input-sm','.input-lg','.radio','.radio-inline']
      'glyphicon': ['[class*=".glyphicon"']
      'grid': ['.container','.row']
      'input-group': ['.input-group','[class*="input-group-"]']
      'jumbotron': ['.jumbotron']
      'labels': ['.label','[class*="label-"]']
      'list-group': ['.list-group','[class*="list-group-"]']
      'media': ['.media','[class*="media-"]']
      'modal': ['.modal','[class*="modal-"]']
      'navbar': ['.navbar','[class*="navbar-"]']
      'nav': ['.nav','.nav-tabs','.nav-pills','.nav-stacked','.nav-justified']
      'pager': ['.pager']
      'pagination': ['.pagination','[class*="pagination-"]']
      'panels': ['.panel','[class*="panel-"]']
      'popover': ['.popover','[data-toggle="popover"]']
      'progress-bars': ['.progress','[class*="progress-"]']
      'responsive-utilities': ['[class*="visible-"]','[class*="hidden-"]']
      'tab': ['[data-toggle="tab"]']
      'table':['.table','[class*="table-"]']
      'thumbnail': ['.thumbnail']
      'tooltip': ['.tooltip','[class*="tooltip-"]']
      'type': ['.lead','[class*="text-"]','.page-header','.list-unstyled','.list-inline','.dl-horizontal','.initialism','.small']
      'utilities': ['.clearfix','.center-block','.pull-right','.pull-left','.hide','.show','.invisible','.text-hide','.hidden','.affix']
      'wells': ['.well','.well-lg','.well-sm']
  init: ->
    console.log 'Commitment Analyzer has loaded'
    if Object.keys(this.frameworks).length is 1
      this.analyze(Object.keys(this.frameworks)[0])
    else
      console.log "To Run type CommitmentAnalyzer.analyze('framework name') or run CommitmentAnalyzer.supportedFrameworks() to see supported frameworks"
  supportedFrameworks: ->
    console.log "The following frameworks are supported:"
    console.log "#{Object.keys(this.frameworks).join('\n')}"
  analyze: (framework) ->
    selectors = this.frameworks[framework]
    if selectors
      this.selectedFramework = framework
      this.selectedFrameworkTotalModules = Object.keys(selectors).length
      for key, value of selectors
        elements = document.querySelectorAll(value)
        this.elementsCount += elements.length
        if elements.length and key not in this.modulesMatched
            this.modulesMatched.push(key)
      this.output()
    else
      console.log "The #{framework} Framework is not currently supported"
      this.supportedFrameworks()
  output: ->
    console.log 'The results are in'
    console.log "Your level of commitment to #{this.selectedFramework} is #{Math.round(this.modulesMatched.length/this.selectedFrameworkTotalModules*100)}%"
    console.log 'You are using the following components:'
    console.log "#{this.modulesMatched.join('\n')}"
CommitmentAnalyzer.init()