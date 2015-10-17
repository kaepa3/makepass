$ (event, data) ->
  console.log data

makedata = ->
  enable_members = [ 'uppercase','lowercase', 'symbol', 'number']
  array = {}
  for member in enable_members
    array[member] = $("#" + member).prop("checked")
  array["length"] = $("#pass").val()
  return array

@update_status = ->
  thisevent = $.ajax ({
    async: true
    url: '/makepass/update'
    type: "POST",
    data: makedata()
    })

  thisevent.done (data, stat, xhr) ->
    $('#show_output').html(data)
    console.log { done: stat, data: data, xhr: xhr }

  thisevent.fail (xhr, stat, err) ->
    console.log { fail: stat, error: err, xhr: xhr }
    alert xhr.responseText

  thisevent.always (res1, stat, res2) ->
    console.log { always: stat, res1: res1, res2: res2 }
