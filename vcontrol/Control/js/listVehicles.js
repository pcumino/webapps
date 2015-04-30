$(document).ready(function(){

	event.preventDefault();
	manageActionButtons();

	getVehicles();

});
/*
placeTable(val)
	This function mounts the JSON file into a HTML table.
*/ 
function placeTable(val){
	var vTableBody = '';
	var vTableTail = '</table>';
	var vTableHead = "<table class='table table-bordered'>"+
					"<tr>"+
						"<th>Foto</th>"+
						"<th>Fabricante</th>"+
						"<th>Cor</th>"+
						"<th>Modelo</th>"+
						"<th>Ano</th>"+
						"<th>Kilometragem</th>"+
						"<th>Placa</th>"+
						"<th>Remover</th>"+
						"<th>Ações</th>"+
					"</tr>";

	for (var i = 0; i < val.length; i++) {
		vTableBody += "<tr>"+
						"<td><img src='Model/carIcons/"+val[i].id+".png'></td>"+
						"<td>"+val[i].fabric+"</td>"+
						"<td>"+val[i].color+"</td>"+
						"<td>"+val[i].model+"</td>"+
						"<td>"+val[i].year+"</td>"+
						"<td>"+val[i].km+"</td>"+
						"<td>"+val[i].plate+"</td>"+
						"<td><input class='checkbox' type='checkbox'></td>"+
						"<td id='list-action'>"+
							"<div id='v_id' hidden>000003</div>"+
								"<a class='glyphicon glyphicon-eye-open' id='open' href='#' title='Ver detalhes do veículo'></a>"+
								"<a class='glyphicon glyphicon-pencil' id='edit' href='#' title='Editar veículo'></a>"+
								"<a class='glyphicon glyphicon-remove' id='delete' href='#' title='Remover veículo'></a>"+
							"<div id='list-button-info'><i>info</i></div>"+
						"</td>";
	};
	var total = vTableHead+vTableBody+vTableTail;
	$('#vehiclelist-module').html(total);
}

/*
getVehicles()
	GET request for the JSON file. It gets the JSON file
	presents in the 'url' address and loads into the HTML table
*/ 

function getVehicles(){
	var vehiclesReq = new XMLHttpRequest();
	// var url = 'Model/JSON/allVehicles.json';
	var url = 'Control/listVehicles.php';

	vehiclesReq.onreadystatechange = function() {
		if (vehiclesReq.readyState == 4 && vehiclesReq.status == 200) {
			var jsonData = JSON.parse(vehiclesReq.responseText);
			var vehiclesArr = jsonData.vehicles;

			placeTable(vehiclesArr);
		}
	}

	vehiclesReq.open("GET", url, true);
	vehiclesReq.send();
}

function loadEntireHtml(){
	$.get('templates/carListTemplate.html', function(data){
		//temporary method to load table of vehicles
		$("#vehiclelist-module").load("templates/carListTemplate.html");
	});
}

function manageActionButtons(){
	var text = 'info';

	$('a#open').on('mouseover',function(){
		$("#list-button-info").find('i').html('Abrir');
	});

	$('a#open').on('mouseleave',function(){
		$("#list-button-info").find('i').html(text);
	});
}