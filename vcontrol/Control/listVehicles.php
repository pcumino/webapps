<?php
	require ("DBmanager.php");
	$db = new DBmanager();
	$db->setUserNpass('root','rootpass');
	$db->mysqlConnect();
	$db->listAllValues('vehicles');
	$db->mysqlDisconnect();
?>
