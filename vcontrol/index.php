<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<meta charset='utf-8'>
	<link rel="stylesheet" type="text/css" href="../apis/bootstrap/css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="../apis/bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" type="text/css" href="../apis/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../apis/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../apis/bootstrap/css/bootstrap-theme.css.map">
	<link rel="stylesheet" type="text/css" href="../apis/bootstrap/css/bootstrap.css.map">
	<link rel="stylesheet" type="text/css" href="View/css/style.css">
</head>
<body class="panel-body">
	<div class="navbar">
		<ul class="panel panel-default nav navbar-default nav-pills">
			<li id="listVehiclesLink" role="presentation" class="navbar-left block">
				<a href="#listVehicles_req" class="text-uppercase">Todos os veículos</a>
			</li>
			<li id="addVehicleLink" role="presentation" class="navbar-left block">
				<a href="#addVehicle_req" class="text-uppercase">Adicionar veículo</a>
			</li>
			<li id="login" role="presentation" class="navbar-left block">
				<a href="#login_req" class="text-uppercase">Login</a>
			</li>
			<li id="menu" role="presentation" class="navbar-right block">
				<a class="text-uppercase" href="../">
					<img class='img-link img-circle' src="../img/mini-logo.png">
					Nossas aplicações
				</a>
			</li>
		</ul>
	</div>

	<div class="manage-module" id="manage-module">
		<img src="View/img/loading.gif">
	</div>

</body>

<div class="scripts">
	<script type="text/javascript" src="../apis/jQuery.js"></script>
	<script type="text/javascript" src="View/js/navbar.js"></script>
</div>

</html>