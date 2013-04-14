# scripts.js


WebFontConfig = google:
  families: [ "Lato:400,700,900,400italic", "Open+Sans:400italic,600italic,700italic,400,600,700" ]

(->
  wf = document.createElement("script")
  wf.src = (if "https:" is document.location.protocol then "https" else "http") + "://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js"
  wf.type = "text/javascript"
  wf.async = "true"
  s = document.getElementsByTagName("script")[0]
  s.parentNode.insertBefore wf, s
)()


# ---------------------------------
# jQuery's domReady

$ ->
  #Prepare
  $document = $(document)
  $body = $(document.body)

  # ---------------------------------
  # Links

  # ---------------------------------
  # Misc

  # Show javascript properties
  $('.js').removeClass('js')

  # Handle more to read areas
  $('.more-to-read').hide()
  $('.read-more').click ->
    #_gaq?.push(['_trackEvent', "Read More", document.title, document.location.href, 0, true])
    $(this).hide().next('.more-to-read').show()

