document.body.addEventListener("touchstart", function () { });

$(document).ready(function() {
	"use strict";
	
	$(".pinp_btn").click(function() {
		$(".filter_pop").fadeIn(0).animate({
			left: 0,
			width: "100%"
		},80).css("z-index","999");
		$("html,body").css({
			"height": "100%",
			"overflow-y": "hidden"
		});
	});
	$(".pp_back, .pp_pop ul a").click(function() {
		$(".filter_pop").animate({
			"left": "100%",
			"width": 0
		},80).fadeOut(0).css("z-index","3");
		$(".pp_pop").css("left", "110%");
		$(".pp_popbg").fadeOut(40);
		$(".pinp").scrollTop(0);
		$("html,body").css({
			"height": "auto",
			"overflow-y": "auto"
		});
	});
	$(".pinp").find("li a").click(function() {
		$(".pp_popbg").fadeIn(40);
		$(".pp_pop").css("left", "30%");
	});
	$(".pp_popbg").click(function() {
		$(this).fadeOut(40);
		$(".pp_pop").css("left", "100%");
	});
	
	//筛选下拉列表效果
	$(".filter_btn").click(function() {
		$(".filter_btn").not(this).removeClass("active");
		$(".filter_pop2").not($(this).next(".filter_pop2")).slideUp(80);
		$(this).next("div.filter_pop2").slideToggle(80,function() {
			$(document).click(function(event) {
				if (!($(event.target).is(".filter_pop2") || $(event.target).is($(".filter_pop2").find(event.target)) || $(event.target).is(".filter_btn"))) {
					$(".filter_pop2").slideUp(80);
					$(".filter_btn").removeClass("active");
				}
			});
		});
		$(this).toggleClass("active");
	});
	$(".pop2_bg, .filter_pop2 a").click(function() {
		$(this).parents(".filter_pop2").slideUp(80);
		$(this).parents(".filter_pop2").prev("a").removeClass("active");
	});
	$(".close").click(function() {
		$(this).parents(".pop_x").fadeOut(120);
	});
});