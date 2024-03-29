window.namespace = (target, name, block) ->
  [target, name, block] = [exports ? window, arguments...] if arguments.length < 3
  top    = target
  target = target[item] or= {} for item in name.split '.'
  block target, top
  
# namespace 'Hello.World', (exports) ->
#   # `exports` is where you attach namespace members
#   exports.hi = -> console.log 'Hi World!'
# 
# namespace 'Say.Hello', (exports, top) ->
#   # `top` is a reference to the main namespace
#   exports.fn = -> top.Hello.World.hi()
  
# Say.Hello.fn()      
UTIL =
  exec: (controller, action) ->
    eval(controller + '.' + action + '.init()')
    
  init: ->
    $body = $(document.body)
    controller = $.string($body.data("controller")).capitalize().str
    action = $.string($body.data("action")).capitalize().str
    js_required = $body.data("js-required") is true
    if (js_required)
      UTIL.exec(controller, action)
    
$ ->    
  UTIL.init()
  $("body > .topbar").scrollSpy()
  $(".tabs").tabs()
  $("a[rel=twipsy]").twipsy live: true
  $("span[rel=twipsy]").twipsy live: true
  $("a[rel=popover]").popover offset: 10
  $("input[rel=popover], textarea[rel=popover], select[rel=popover]").popover offset: 10, template: '<div class="arrow"></div><div class="inner"><div class="content"><p></p></div></div>'
  $(".topbar").dropdown()
  $(".alert-message").alert()
  domModal = $(".modal").modal(
    backdrop: true
    closeOnEscape: true
  )
  $(".open-modal").click ->
    domModal.toggle()  
	$(".btn").button "complete"
  