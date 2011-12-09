# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
namespace 'Groups.New', (exports) ->
  # `exports` is where you attach namespace members
  exports.init = ->
    $('#interests').tagsInput({
      width: '210px',
      height: '100px'
    });

namespace 'Groups.Create', (exports) ->
  # `exports` is where you attach namespace members
  exports.init = -> 
    Groups.New.init()    
    
namespace 'Groups.Edit', (exports) ->
  # `exports` is where you attach namespace members
  exports.init = -> 
    Groups.New.init()
            
namespace 'Groups.Update', (exports) ->
  # `exports` is where you attach namespace members
  exports.init = -> 
    Groups.New.init()