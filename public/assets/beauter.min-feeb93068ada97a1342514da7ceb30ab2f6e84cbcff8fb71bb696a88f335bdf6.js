 /*!
 * Beauter v0.3.0 (http://beauter.outboxcraft.com)
 * Copyright 2016-2018 Shubham Ramdeo, Outboxcraft
 * Licensed under MIT (https://github.com/outboxcraft/beauter/blob/master/LICENSE)
 */

function showsnackbar(a){var b=document.getElementById(a);b.className=b.className.replace("snackbar","snackbar show");setTimeout(function(){b.className=b.className.replace("show","")},3E3)}function topnav(a){a=document.getElementById(a);a.classList.contains("responsive")?a.className=a.className.replace("responsive",""):a.className+=" responsive"}function openmodal(a){var b=document.getElementById(a);b.style.display="block";window.onclick=function(a){a.target==b&&(b.style.display="none")}}
function openimg(a,b){var c=document.getElementById(a),d=document.getElementById(b),e=d.getElementsByClassName("modal-content")[0],f=d.getElementsByClassName("caption")[0];d.style.display="block";e.src=c.src;f.innerHTML=c.alt}var close=document.getElementsByClassName("-close"),i;
for(i=0;i<close.length;i++)close[i].onclick=function(){var a=this.parentElement;a.classList.contains("modalbox-modal-content")&&(a=a.parentElement);a.style.opacity="0";setTimeout(function(){a.style.display="none";a.style.opacity="1"},600)};var accr=document.getElementsByClassName("accordion"),j;for(j=0;j<accr.length;j++)accr[j].onclick=function(){this.classList.toggle("active");var a=this.nextElementSibling;a.style.maxHeight=a.style.maxHeight?null:a.scrollHeight+"px"};
function opentab(a,b){var c;var d=document.getElementsByClassName("tabcontent");for(c=0;c<d.length;c++)d[c].style.display="none";d=document.getElementsByClassName("tablinks");for(c=0;c<d.length;c++)d[c].className=d[c].className.replace(" active","");document.getElementById(a).style.display="block";b.currentTarget.className+=" active"};
