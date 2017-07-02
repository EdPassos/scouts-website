$(document).on('turbolinks:load', function () {
  $messageImageInput = $('oks');

  $messageImageInput.change(function(e) {
    var $image = $("#message-input-preview img");
    $messageAttachmentPreview.addClass('active');
    $image.attr('src', URL.createObjectURL(e.target.files[0]));
    var $video = $("#message-input-preview video");
    $image.removeClass('hide');
    $video.addClass('hide');
    $("#message-attachments").toggleClass('active');
  });
})
