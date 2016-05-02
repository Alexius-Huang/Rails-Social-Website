$(document).on "page:change", ->
	$("#new-topic-ajax-link").click (event) ->
		event.preventDefault()
		$("#new-topic-ajax-section").slideToggle("slow")
		$(".topic-form-control").focus()
