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

  $("#copy_previous_password").click(function() {
    $("#note_encrypted_text").val($("#note_decrypted_text").val());
  });

  hljs.initHighlightingOnLoad();

  $('#copy-trigger').tooltip({
    trigger: 'click',
    placement: 'bottom'
  });

  function setTooltip(btn, message) {
    $(btn).tooltip('show')
      .attr('data-original-title', message)
      .tooltip('show');
  }

  function hideTooltip(btn) {
    setTimeout(function() {
      $(btn).tooltip('hide');
    }, 500);
  }

  // Copy clipboard stuff
  var clipboard = new Clipboard('#copy-trigger');

  clipboard.on('success', function(e) {
    setTooltip(e.trigger, 'Copied to Clipboard!');
    hideTooltip(e.trigger);
  });
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

