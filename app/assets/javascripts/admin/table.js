$(document).on('turbolinks:load', function () {
  $('tr[data-url]').click(function() {
    Turbolinks.visit($(this).data('url'));
  });
});
