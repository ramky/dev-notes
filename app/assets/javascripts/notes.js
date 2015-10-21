var ready;
ready = function(){
  // Just check for password and initialize highlight on page load
  // Rest should be only when type changes
  if ($("#note_type_id option:selected").text() != "Password"){
    $(".password").hide();
  }

  $("#note_type_id").change(function(){
    handleTypeChanges();
  });

  hljs.initHighlightingOnLoad();
};

$(document).ready(ready);
$(document).on('page:load', ready);

function handleTypeChanges(){
  if ($("#note_type_id option:selected").text() == "Dev Notes"){
    $("#note_text").val('<pre><code class=""></code></pre>');
    $(".password").hide();
  }
  else if ($("#note_type_id option:selected").text() == "Password"){
    $("#note_text").val('');
    $("#note_encrypted_text").val('');
    $(".password").show();
  }
  else{
    $("#note_text").val('');
    $(".password").hide();
  }
}

function copyToClipboard(){
  (function(){
    $.getScript('https://cdnjs.cloudflare.com/ajax/libs/zeroclipboard/2.2.0/ZeroClipboard.min.js', function(data, textStatus) {
      var link = $("#copy-trigger");
      ZeroClipboard.config( { swfPath: "https://cdnjs.cloudflare.com/ajax/libs/zeroclipboard/2.2.0/ZeroClipboard.swf" } );
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
