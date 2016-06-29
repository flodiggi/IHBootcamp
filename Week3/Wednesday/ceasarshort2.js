function encode(i, s) {var W = ''
  i.split('').forEach(function(l){var t=l;var n=t.toUpperCase().charCodeAt(0);var m=(n-65+s)%26
  if (m<0) {var c=m+65+26} else {var c=m+65};
  if(l>='A'&&l<='Z'){W+=String.fromCharCode(c)}else if(l>='a'&&l<='z'){W+=String.fromCharCode(c).toLowerCase()}else{W+=l}})
  return W}
console.log(encode("abc", -1));
