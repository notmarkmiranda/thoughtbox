$(document).ready(function() {
  $('.read, .unread').click(changeStatus)
  $('#filter-read').click(filterRead)
  $('#filter-unread').click(filterUnread)

  $('#alphabetically').click(function(){
    var sorted = sortAlphabetically();
    $('.links .link').remove();
    for (var i = 0; i < sorted.length; i++){
      $('.links').append(sorted[i])
    }
  });
  $('#search-box').on('keyup', searchBox);
});

function searchBox(){
  var searchTerm = $(this).val().toLowerCase();
  $('.links div').each(function(){
    if($(this).filter('[data-search-term *= ' + searchTerm + ']').length > 0 || searchTerm.length < 1){
      $(this).show();
    } else {
      $(this).hide();
    }
  });
}

function sortAlphabetically(){
  var sorted = $('.links .link').sort(function(current, next){
    var current = current.firstChild.nextSibling.innerText.toLowerCase();
    var next = next.firstChild.nextSibling.innerText.toLowerCase();
    if (current < next) {
      return -1;
    }
    if (current > next) {
      return 1;
    }
    return 0;
  });
  return sorted;
}

function filterRead(){
  $('.read-false').toggle(1000)
}
function filterUnread(){
  $('.read-true').toggle(1000)
}

function changeStatus(){
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
}

function otherStatus(currentStatus) {
  if (currentStatus === "unread") {
    return true;
  } else {
    return false;
  }
}
