
$(document).ready(function () {
  console.log('hello');

  var topbar = $('#topbar');

  $(window).scroll(function(e) {
    var min_scroll_amount = 0;
    var scroll_amount = $(this).scrollTop();

    if(scroll_amount > min_scroll_amount) {
      topbar.addClass('scrolled');
    } else {
      topbar.removeClass('scrolled');
    }
  });

  topbar.on('transitionend', function(e) {
    console.log(e.originalEvent.propertyName);
  });
});
