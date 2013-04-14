(function() {
  var WebFontConfig;

  WebFontConfig = {
    google: {
      families: ["Lato:400,700,900,400italic", "Open+Sans:400italic,600italic,700italic,400,600,700"]
    }
  };

  (function() {
    var s, wf;

    wf = document.createElement("script");
    wf.src = ("https:" === document.location.protocol ? "https" : "http") + "://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js";
    wf.type = "text/javascript";
    wf.async = "true";
    s = document.getElementsByTagName("script")[0];
    return s.parentNode.insertBefore(wf, s);
  })();

  $(function() {
    var $body, $document;

    $document = $(document);
    $body = $(document.body);
    $('.js').removeClass('js');
    $('.more-to-read').hide();
    return $('.read-more').click(function() {
      return $(this).hide().next('.more-to-read').show();
    });
  });

}).call(this);
