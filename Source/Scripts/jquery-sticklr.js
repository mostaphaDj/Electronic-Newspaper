 /*
 * Sticklr v1.4
 * Sticky Side Panel CSS + jQuery Plugin
 *
 * Copyright 2011-2012 amatyr4n
 * http://codecanyon.net/user/amatyr4n
 *
 * licensed under Envato licenses
 * http://wiki.envato.com/support/legal-terms/licensing-terms/
 */
 
(function($){

    $.fn.sticklr = function(method){

        var defaults = {
            animate         : false,
            colWidth	    : '180px',
            relativeGap     : 15,
            relativeTo      : 'center',
            showOn		    : 'click',
            size            : 16,
            stickTo         : 'left'
        };
               
        var methods = {
        
            init : function(opts){

                return this.each(function(){
                    var $sticklr = $(this);
                    var props = $.extend({}, defaults, opts);
                    var top = helpers.calcTop(props.animate, props.relativeTo, props.relativeGap, $sticklr.height());
                    
                    if(!$sticklr.hasClass('sticklr')) $sticklr.addClass('sticklr');
                    if(props.stickTo == 'right') $sticklr.addClass('sticklr-right');                    
                    if(props.showOn == 'hover') props.showOn = 'mouseenter';
               
                    $sticklr
                        .addClass('sticklr-js')
                        .css({
                            'position'  : (props.animate ? 'absolute' : 'fixed'),
                            'top'       : top,
                            'width'     : parseInt(props.size) + 8
                        })
                        .data('props', props)
					    .find('a[href="#"]')
					        .bind('click', function(e){
						        e.preventDefault();
					        })
					        .end()
					    .children('li')
					        .css({
					            'height' : parseInt(props.size) + 8
					        })
					        .children('a')
					            .css({
					                'height' : props.size,
					                'width' : props.size
					            })
					            .bind('click', function(){
					                methods.hide();
					            })					            
					            .bind(props.showOn, function(){
					                if(!$(this).siblings().hasClass('sticklr-active')){
                                        methods.hide();
                                        var arrowStyle = $(this).siblings('ul').length ?
                                                        (
                                                            'class="sticklr-arrow" style="' 
                                                            + ((props.stickTo == 'left') ? 'left:' : 'right:') 
                                                            + (parseInt(props.size) + 8) + 'px;top:' + (parseInt(props.size) / 2) + 'px"'
                                                        )
                                                        : '';
                                        $(this)
                                            .append('<span ' + arrowStyle + '></span>')
                                            .siblings()
                                                .each(function(){                                                        
                                                    $(this)
                                                        .css({
                                                            'margin-left'   : parseInt(props.size) + 34,
                                                            'margin-right'  : parseInt(props.size) + 34,
                                                            'opacity'       : 0,
                                                            'position'      : 'absolute',
                                                            'top'           : 0
                                                        })
                                                        .show();                                                            
                                                    var totalHeight = $(this).height() + $(this).offset().top;
                                                    var windowHeight = $(window).height() + $(window).scrollTop();
                                                    var newTop = 0;                                                        
                                                    if(totalHeight > windowHeight){
                                                        newTop = parseInt($(this).css('top'), 10) - (totalHeight - windowHeight);
                                                    }                                                        
                                                    $(this)
                                                        .css({
                                                            'top'           : newTop
                                                        })
                                                        .animate({
                                                            'margin-left'   : parseInt(props.size) + 4,
                                                            'margin-right'  : parseInt(props.size) + 4,
                                                            'opacity'       : 1.0
                                                        }, 200);
                                                })
                                                .addClass('sticklr-active');
                                    }
                                    if($(this).attr('href') == '#'){
                                        return false;
                                    }
					    });
				
				    if($.browser.msie || props.colWidth != defaults.colWidth){
					    for(var i = 2; i < 10; i++){
                            var newLeft = 23 + i + (parseInt(props.colWidth, 10) * (i - 2));
                            var newRight = 'auto';
                            if(props.stickTo == 'right'){
                                newRight = newLeft;
                                newLeft = 'auto';
                            }
						    $sticklr.find('li').find('ul:nth-child(' + i + ')').css({
							    'left'	: newLeft,
							    'right' : newRight,
							    'width'	: props.colWidth
						    });
					    }
				    }
                });
            },
        
            hide: function(){
                var mL = $('.sticklr-active').css('margin-left');
                var mR = $('.sticklr-active').css('margin-right');
                $('.sticklr-active').animate({
                        'margin-left'   : parseInt(mL) + 14,
                        'margin-right'  : parseInt(mR) + 14,
                        'opacity'       : 0
                    }, 200, function(){
                        $(this)
                            .removeClass('sticklr-active')
                            .hide();
                });
                $('span.sticklr-arrow').remove();
            }
        };

        var helpers = {
        
            calcTop : function(anim, on, gap, h){
                if(/top|high/i.test(on)){
                    return (anim ? $(window).scrollTop() : 0) + gap;                
                } else if(/bottom|low|ground/i.test(on)){
                    return (anim ? ($(window).scrollTop() + $(window).height() - h) : ($(window).height() - h)) - gap;
                } else {
                    return anim ? ($(window).scrollTop() + (($(window).height() - h) / 2)) : (($(window).height() - h) / 2);
                }
            },
            
            fixPos: function(){
                $('.sticklr').each(function(){
                    var top = $(this).data('props').relativeTo;
                    var gap = $(this).data('props').relativeGap;
                    var h = $(this).height();
                    if($(this).css('position') == 'absolute'){
                        $(this).stop().animate({
                            'top'   : helpers.calcTop(true, top, gap, h)
                        }, 1000);
                    } else {
                        $(this).css({
                            'top'   : helpers.calcTop(false, top, gap, h)
                        });
                    }
                });
            }
        };
        
        $(window).bind({
            resize: helpers.fixPos,
            scroll: helpers.fixPos
        });

        $(document).bind('click', function(e){
            if(!$(e.target).parents().hasClass('sticklr')){
                methods.hide();
            }
        });
        
        if (methods[method] && method.toLowerCase() != 'init'){
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method){
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method "' +  method + '" does not exist in Sticklr');
        }     
    }
})(jQuery);
