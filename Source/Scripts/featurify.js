(function($) {

$.fn.featurify = function(options) {

var that = this;

$(window).load(function() {

var settings = {
	transition : 750,
	pause : 5000,
	directionIn : 1,
	directionOut : -1,
};

if (options) $.extend(settings, options);

var featuresWidth = that.width(),
	ul = that.find("ul"),
	li = ul.find("li"),
	liWidth = li.width(),
	t = undefined,
	on = false;

that.css({
		overflow:"hidden"
	});

li.hide().first().show();

var featuresHeight = ul.height();

ul.css({
		width: featuresWidth + "px",
		position: "relative",
		height: featuresHeight + "px",
	});

var position = li.first().position();
	
li.css({
		position : "absolute",
		width: liWidth + "px"
	});

var loop = function() {
	
	if (on) return;	

	on = true;

	var li = that.find("li"),
		first = li.first(),
		next = first.next();

	first.css("left", position.left + "px")
		.show()
		.clone()
		.hide()
		.insertAfter(li.last());;

	next.css({
			"left" : settings.directionIn * featuresWidth + "px",
			opacity : 0
		})
		.show();

	first.animate({
			opacity: 0,
			left: settings.directionOut * featuresWidth + "px" 
		},
		settings.transition,"easeOutSine",
		function() {
			$(this).remove();
		});

	next.animate({
			opacity: 1,
			left: position.left + "px",
		},
		settings.transition,"easeOutSine");

	setTimeout(function() { on = false; }, settings.transition);
	
	if (t)
		t = setTimeout(function() { loop(); }, settings.pause);
}

that.hover(function() {
		clearTimeout(t);
		t = undefined;
	},
	function() {
		t = setTimeout(function() { loop(); }, settings.transition);
	});

t = setTimeout(function() { loop(); }, settings.pause);

});

return this;
};

})(jQuery);