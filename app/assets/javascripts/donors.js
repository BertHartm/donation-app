'use strict';
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

function initializeMap() {
    // should call geolocation here and get users actual location
    var mapOptions = {
        center: new google.maps.LatLng(40.7127, -74.0059),
        zoom: 8
    };
    var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
    experience_donations.forEach(function(el, idx, arr) {
        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(el.donation_type.latitude, el.donation_type.longitude),
            map: map,
            title: el.title
        });
    });
}
google.maps.event.addDomListener(window, 'load', initializeMap);
