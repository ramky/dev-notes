var ready;
ready = function(){
  togglePassword();

  $("#note_type_id").change(function(){
    togglePassword();
  });

  hljs.initHighlightingOnLoad();
};

$(document).ready(ready);
$(document).on('page:load', ready);

function togglePassword(){
  if ($("#note_type_id option:selected").text() == "Password"){
    $(".password").show();
  }
  else{
    $(".password").hide();
  }
}

function copyToClipboard(){
  (function(){
    $.getScript('//cdnjs.cloudflare.com/ajax/libs/zeroclipboard/2.2.0/ZeroClipboard.min.js', function(data, textStatus) {
      var link = $("#copy-trigger");
      ZeroClipboard.config( { swfPath: "//cdnjs.cloudflare.com/ajax/libs/zeroclipboard/2.2.0/ZeroClipboard.swf" } );
      link.client = new ZeroClipboard( link );
      link.client.on('ready', function( readyEvent ) {
        link.client.on( 'aftercopy', function(e) {
          $(e.target).after('<div class="alert alert-success">Copied to Clipboard!</div>');
          $(e.target).next().delay(500).fadeOut();
        });
      });
    });


  })();
}
