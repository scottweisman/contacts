$(function() {

	$(".hidden_info").hide();
	$("h4.contact_link").click(function () {
		$(this).toggleClass("active").next().slideToggle("fast");
		e.preventDefault();
	});

	$("#new_contact_form_partial").hide();
	$("p.new_contact_link").click(function () {
		$("div.contacts").hide();
		$("p.new_contact_link").hide();
		$("#new_contact_form_partial").show();
		$("#contact_first_name").focus();
	});

	$('#website_opt_input').hide();
	$('div#website_opt_text').click(function () {
		$('div#website_opt_text').hide();
		$('#website_opt_input').show();
	});

	$('#linkedin_opt_input').hide();
	$('div#linkedin_opt_text').click(function () {
		$('div#linkedin_opt_text').hide();
		$('#linkedin_opt_input').show();
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
