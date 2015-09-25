@update_status = ->
  $.ajax
    url: '/makepass/update'
    type: "POST", 
    data: makedata()
  return

makedata = ->  
  enable_members = [ 'uppercase','lowercase', 'symbol', 'number']
  array = {}
  for member in enable_members
    array[member] = $("#" + member).prop("checked")
  array["length"] = $("#pass").val()
  return array

$ ->
  $('#text_name').on
    'ajax:success': (event, data, status, xhr) ->
      console.log "kjkjhkjhkh"
      $('#show_anyway').html(data)
    'ajax:error': (event, xhr, status, error) ->
      console.log "kjkgyiujhkjhkh"
