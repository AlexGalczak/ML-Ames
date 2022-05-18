function set_neighborhood( value ) {
  var el = document.querySelector('input[type="text"]');
  el.value = value;
  invalidateLater(1)
}