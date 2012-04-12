var stripTrailingSlash = function(str) {
  if (str.substring(str.length-1) == "/"){
    var to_return = str.substring(0, str.length - 1);
      return to_return; }
  return str; }