
function hideFlashNotice(){
  document.getElementsByClassName('flash-notice')[0].style.visibility = "hidden";
}

window.onload = function(){
  setTimeout(hideFlashNotice, 4000);
}
