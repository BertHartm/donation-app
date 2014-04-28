// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
    $(".donation-type-form").hide();

    $('input#donation_type_physical').on("click", function() {
	$(".donation-type-form").hide();
	$("#physical").show();
    });
    $('input#donation_type_voucher').on("click", function() {
	$(".donation-type-form").hide();
	$("#voucher").show();
    });
    $('input#donation_type_experience').on("click", function() {
	$(".donation-type-form").hide();
	$("#experience").show();
    });
});