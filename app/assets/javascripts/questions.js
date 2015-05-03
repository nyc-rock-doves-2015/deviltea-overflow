$(document).ready(function() {

  var vote_post = function(event) {
    event.preventDefault();
    $form = $(event.target).closest('form');

    $.ajax({
      type: $form.attr('method'),
      url: $form.attr('action'),
      data: $form.serialize()
    }).done(function(response) {

      votableType = $form.children('#vote_votable_type')[0].value.toLowerCase();
      points = $form.closest('.col-md-1').find('.' + votableType + '-points')[0];
      points.innerHTML = response;
    });
  };

  $('.fa-chevron-up').on('click', vote_post);
  $('.fa-chevron-down').on('click', vote_post);

  $('.nav-tabs a').click(function (e) {
    window.location = this.href;
  });
});