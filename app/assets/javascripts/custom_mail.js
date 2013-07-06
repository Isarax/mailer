$(function() {
  $('#image-upload a').on('click', function() {
    $('#hidden-image-upload input').trigger('click');
  });

  $('#hidden-image-upload input').on('change', function() {
    $('#image-upload p').html($(this).val().split(/[\\\/]/).slice(-1)[0]);
    if(validate_file($(this).val())) {
      document.getElementById('submit-button').disabled = false;
    }
    else {
      document.getElementById('submit-button').disabled = true;
      alert('Invalid file type, please select image.');
    }

  });

  function validate_file(path) {
    var valid_extensions = { ".jpg" : true, ".jpeg" : true, ".bmp" : true, ".gif" : true, ".png" : true };
    var filename = path.split(/[\\\/]/).slice(-1)[0]
    var ext = filename.match(/\..+$/);
    return valid_extensions[ext];
  }
});