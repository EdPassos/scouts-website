$(document).on('turbolinks:load', function () {
  var $notice = $("#notice");

  if($notice.length > 0) {
    $notice.click(function() {
      $(this).remove();
    })
  }
})
