/**
 * 
 */
 
$(function(){
 
	$("ul#headerUl>li").mouseover(function(){
		
		$(this).children("ul.downGnb").slideDown("fast");
		
	});
	
	$("ul#headerUl>li").mouseleave(function(){
		
		$(this).children("ul.downGnb").slideUp("fast");
		
	});
	
	$("li.slideCommu").mouseover(function(){
		
		$(this).children("ul.commuUl").slideDown("fast");
		
	});
	
	$("li.slideCommu").mouseleave(function(){
		
		$(this).children("ul.commuUl").slideUp("fast");
		
	});
 
});