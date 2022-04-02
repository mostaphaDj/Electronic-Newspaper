// -----------------------------------------------------------------------------------
// http://wowslider.com/
// JavaScript Wow Slider is a free software that helps you easily generate delicious 
// slideshows with gorgeous transition effects, in a few clicks without writing a single line of code.
// Last updated: 2011-10-27
//
//***********************************************
// Obfuscated by Javascript Obfuscator
// http://javascript-source.com
//***********************************************
function ws_fly(d, a, b) { var e = jQuery; var c = e("li", b); b.css("overflow", "hidden"); c.each(function (f) { if (f == d.startSlide) { e(this).show() } else { e(this).hide() } }); this.go = function (f, j, g) { var h = 0; if (g) { if (g >= 1) { h = 1 } if (g <= -1) { h = 0 } } var l = (h ? 1 : -1) * d.width / 4; var k = e(c.get(f)); k.stop(1, 1); k.css({ opacity: "hide", left: l, "z-index": 3 }); k.animate({ opacity: "show" }, { duration: d.duration, queue: false }); k.animate({ left: 0 }, { duration: 2 * d.duration / 3, queue: false }); var i = e(c.get(j)); setTimeout(function () { i.animate({ left: -l, opacity: "hide" }, 2 * d.duration / 3, function () { i.css("left", 0); k.css({ "z-index": "", opacity: 1 }) }) }, d.duration / 3); return f } }; // -----------------------------------------------------------------------------------
// http://wowslider.com/
// JavaScript Wow Slider is a free software that helps you easily generate delicious 
// slideshows with gorgeous transition effects, in a few clicks without writing a single line of code.
// Last updated: 2011-10-27
//
//***********************************************
// Obfuscated by Javascript Obfuscator
// http://javascript-source.com
//***********************************************
jQuery("#wowslider-container1").wowSlider({effect:"fly",prev:"",next:"",duration:1,delay:100*20,outWidth:530,outHeight:231,width:530,height:321,autoPlay:true,stopOnHover:true,loop:false,bullets:true,caption:true,controls:true,logo:"engine1/loading.gif"});