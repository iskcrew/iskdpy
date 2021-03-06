@isk or= {}

escapetimeout=undefined
escape=3

reset_escape = ->
  escape=3

$(document).keypress (e) ->
  clearTimeout(escapetimeout)
  escapetimeout=setTimeout(reset_escape, 300)
  if e?.key == "Escape" or e?.key == "Esc"
    if --escape <= 0
      isk.fsm.exit()
      return false
  else
    reset_escape()
  return true

$('body').click (e) ->
  THREEx?.FullScreen?.request?()
  return false

$('#renderer').click (e) ->
  clearTimeout(escapetimeout)
  escapetimeout=setTimeout(reset_escape, 300)
  if --escape <= 0
    isk.fsm.exit()
    return false
  return true

$('#stopped').click (e) ->
  isk.fsm.run()
  return false
