
<?php 
//error_reporting(E_ALL ^ E_NOTICE);
$con=mysql_connect('localhost','root','dm') or die("Sorry! could not connect".mysql_error());
mysql_select_db("election",$con);
?>
