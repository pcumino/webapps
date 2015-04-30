$(document).ready(function(){

	var currentUrl = window.location.href;

	// $.get("View/listVehicles.html", function (data) {
	// 	currentUrl = window.location.href;
	// 	console.log('current url = '+currentUrl);
	// 	$('#listVehiclesLink').addClass('active');
	// 	$("#manage-module").html(data);
	// });

	$.get("View/addVehicle.html", function (data) {
		currentUrl = window.location.href;
		console.log('current url = '+currentUrl);
		$('#listVehiclesLink').addClass('active');
		$("#manage-module").html(data);
	});

	$('#addVehicleLink').click(function(){
		$('#listVehiclesLink').removeClass('active');
		$('#addVehicleLink').addClass('active');
		$('#login').removeClass('active');

		if(currentUrl != 'http://localhost/gmmapps/vcontrol/#addVehicle_req'){
			$.get("View/addVehicle.html", function (data) {
				$("#manage-module").html(data);
				currentUrl = window.location.href;
			});
		}
		else{
			// console.log('prevent reload');
		}
	});
	$('#listVehiclesLink').click(function(){
		$('#listVehiclesLink').addClass('active');
		$('#addVehicleLink').removeClass('active');
		$('#login').removeClass('active');

		if(currentUrl != 'http://localhost/gmmapps/vcontrol/#listVehicles_req'){
			$.get("View/listVehicles.html", function (data) {
					$("#manage-module").html(data);
					currentUrl = window.location.href;
				});
		}
		else{
			// console.log('prevent reload');
		}
	});
	$('#login').click(function(){
		$('#listVehiclesLink').removeClass('active');
		$('#addVehicleLink').removeClass('active');
		$('#login').addClass('active');

		if(currentUrl != 'http://localhost/gmmapps/vcontrol/#login_req'){
			$.get("View/login.html", function (data) {
				$("#manage-module").html(data);
				currentUrl = window.location.href;
			});
		}
		else{
			// console.log('prevent reload');
		}
	});

	// $.get("View/login.html", function (data) {
	// 	$("#manage-module").append(data);
	// });
	// $.get("View/addVehicle.html", function (data) {
	// 	$("#manage-module").append(data);
	// });
	// $.get("View/listVehicles.html", function (data) {
	// 	$("#manage-module").append(data);
	// });
});

function changeTitle(val){
	$('title').html(val);
}