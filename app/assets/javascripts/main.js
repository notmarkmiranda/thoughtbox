$(() => {

  $('.read, .unread').click(function(){
    var $this = $(this);
    var $read = $this.prev();

    var id = $this.data('id');
    var currentStatus = $this.attr('class');
    var newStatus = otherStatus(currentStatus);

    $.ajax({
      type: 'PATCH',
      url: '/api/v1/links/' + id,
      data: {link: {read: newStatus}},
      success:[
        $this.toggleClass("read unread"),
        $read.toggleClass("link-read link-unread")
      ]
    });
  });


});

function otherStatus(currentStatus) {
  if (currentStatus === "unread") {
    return true;
  } else {
    return false;
  }
}
