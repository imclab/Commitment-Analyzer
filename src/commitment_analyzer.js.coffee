window.CommitmentAnalyzer =
  modulesMatched: []
  elementsCount: 0
  selectedFramework: ''
  selectedFrameworkTotalModules: 0
  frameworks:
    bootstrap3:
      'alert': ['.alert','.alert-dismissable','.alert-success','.alert-info','.alert-warning','.alert-danger'],
      'badge': ['.badge'],
      'breadcrumb': ['.breadcrumb'],
      'btn-group' : ['.btn-group','.btn-group-vertical','.btn-toolbar','.btn-group-justified','.dropup'],
      'btn':['.btn','.btn-default','.btn-primary','.btn-warning','.btn-danger','.btn-success','.btn-info','.btn-link','.btn-lg','.btn-sm','.btn-xs','.btn-xs','.btn-block'],
      'carousel':['.carousel','.carousel-inner'],
      'close':['.close'],
      'form':['.control-label','.checkbox','.checkbox-inline','.form-control','.form-control-static','.form-horizontal','.form-inline','.form-group','.has-warning','.has-error','.has-success','.help-block','.input-sm','.input-lg','.radio','.radio-inline'],
      'grid':['.container','.row'],
      'jumbotron':['.jumbotron'],
      'nav':['.nav','.nav-tabs','.nav-pills','.nav-stacked','.nav-justified'],
      'popover':['.popover','[data-toggle="popover"]'],
      'tab':['[data-toggle="tab"]'],
      'responsive-utilities': ['.visible-xs', '.visible-sm', '.visible-md', '.visible-lg','.hidden-xs','.hidden-sm','.hidden-md','.hidden-lg','.visible-print','.hidden-print'],
      'utilities':['.clearfix','.center-block','.pull-right','.pull-left','.hide','.show','.invisible','.text-hide','.hidden','.affix'],
      'wells':['.well','.well-lg','.well-sm']
  init: ->
    console.log 'Commitment Analyzer has loaded'
    if Object.keys(this.frameworks).length is 1
      this.analyze(Object.keys(this.frameworks)[0])
    else
      console.log "To Run type CommitmentAnalyzer.analyze('framework name') or run CommitmentAnalyzer.supportedFrameworks() to see available frameworks"
  supportedFrameworks: ->
    console.log "The following frameworks are supported:"
    console.log "#{Object.keys(this.frameworks)}"
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
      console.log "The following frameworks are supported:"
      console.log "#{Object.keys(this.frameworks)}"
  output: ->
    console.log 'The results are in'
    console.log "Your level of commitment to #{this.selectedFramework} is #{(this.modulesMatched.length/this.selectedFrameworkTotalModules*100)}%"
    console.log 'You are using the following modules'
    console.log "#{this.modulesMatched}"
CommitmentAnalyzer.init()