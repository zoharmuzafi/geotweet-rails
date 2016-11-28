// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
	console.log('ready');
	$('form').on('submit', function(event){
		event.preventDefault();
		var lon = $('#lon').val();
		var lat = $('#lat').val();
		var distance = $('#distance').val();
		$.get("/search", { lon: lon, lat: lat, distance: distance }, function(data){
			$('#list').empty();
			for(i=0; i<data.data.length;i++){
				$('#list').append('<li>' + data.data[i].text + ' ' +data.data[i].created_at + '</li>');
			}
		});
	});
});
