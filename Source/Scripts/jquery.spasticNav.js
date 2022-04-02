(function($) {

	$.fn.spasticNav = function(options) {
	
		options = $.extend({
			overlap : 20,
			speed : 500,
			reset : 100,
			color: '#b10526',
			easing: 'easeOutElastic'
		}, options);
	
		return this.each(function() {
		
		 	var nav = $(this),
		 		currentPageItem = $('li', nav).first(),
		 		blob,
		 		reset;
		 		
		 	$('<li id="blob"></li>').css({
		 		width : currentPageItem.outerWidth(),
		 		height : currentPageItem.outerHeight() + options.overlap,
		 		left : currentPageItem.position().left,
		 		top : currentPageItem.position().top - options.overlap / 2,
		 		backgroundColor : options.color
		 	}).appendTo(this);
		 	
		 	blob = $('#blob', nav);
		 	// mouse out	
		 	reset = setTimeout(function () {
		 	    blob.animate({
		 	        width: currentPageItem.outerWidth(),
		 	        left: currentPageItem.position().left
		 	    }, options.speed)
		 	}, options.reset);

			//$('li:not(#blob)', nav).hover(function() {
		 	$(nav).children('li:not(#blob)').hover(function () {
			    // mouse over
                
				clearTimeout(reset);
				blob.animate(
					{
						left : $(this).position().left,
						width : $(this).width()
					},
					{
						duration : options.speed,
						easing : options.easing,
						queue : false
					}
				);
			}, function() {
				// mouse out	
				reset = setTimeout(function() {
					blob.animate({
						width : currentPageItem.outerWidth(),
						left : currentPageItem.position().left
		}, options.speed, 'easeInOutBack')
				}, options.reset);
	
			});
		
		}); // end each
	
	};

})(jQuery);