/**
 * 
 */
 
$(function(){

	$("li.goSite").click(function(){
		
		$("div#sitemapArea").css({"display":"block"});
		
	});
	
	$("button#closeSite").click(function(){
	
		$("div#sitemapArea").css({"display":"none"});
	
	});
 
});