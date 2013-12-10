window.setAutocomplete = (target, appended, source) ->
  data = $(target).autocomplete
    source: source
    appendTo: appended
