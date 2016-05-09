$(document).on "page:change", ->
  $("#new-topic-ajax-link").click (event) ->
    event.preventDefault()
    $("#new-topic-ajax-section").slideToggle("slow")
    $(".topic-form-control").focus()

  $("#topic-list-ajax-link").click (event) ->
    event.preventDefault()
    $("#topics-ajax-section").slideToggle("slow")
