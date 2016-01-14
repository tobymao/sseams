var measurements = {
  updateHeight: function() {
    var feet = parseInt(document.getElementById('feet').value);
    var inches = parseInt(document.getElementById('inches').value);
    document.getElementById('height').value = feet * 12 + inches;
  },

  updateFile: function(e) {
    var id = e.id;
    var position = id.split('_')[1];
    document.getElementById(position + '_label').innerHTML = e.value.split('\\').pop();
  },
};
