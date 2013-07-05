$(function() {
  $('#image-upload a').on('click', function() {
    $('#hidden-image-upload input').trigger('click');
  });

  $('#hidden-image-upload input').on('change', function() {
    $('#image-upload p').html($(this).val().split(/[\\\/]/).slice(-1)[0]);
  });
});