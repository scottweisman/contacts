$(function() {  
	
	$(".hidden_info").hide();
	$("h4.contact_link").click(function () {
		$(this).toggleClass("active").next().slideToggle("fast");
		return false;		
	});
	
	$("#new_contact_form_partial").hide();
	$("p.new_contact_link").click(function () {
		$("div.contacts").hide();
		$("p.new_contact_link").hide();
		$("#new_contact_form_partial").show();
	});
	
	$('#website_opt_input').hide();
	$('div#website_opt_text').click(function () {
		$('div#website_opt_text').hide();
		$('#website_opt_input').show();
	});
	
	$('#facebook_opt_input').hide();
	$('div#facebook_opt_text').click(function () {
		$('div#facebook_opt_text').hide();
		$('#facebook_opt_input').show();
	});
	
	$('#twitter_opt_input').hide();
	$('div#twitter_opt_text').click(function () {
		$('div#twitter_opt_text').hide();
		$('#twitter_opt_input').show();
	});
	
	$('#address_opt_input').hide();
	$('div#address_opt_text').click(function () {
		$('div#address_opt_text').hide();
		$('#address_opt_input').show();
	});
	
	$('#note_opt_input').hide();
	$('div#note_opt_text').click(function () {
		$('div#note_opt_text').hide();
		$('#note_opt_input').show();
	});
	
});