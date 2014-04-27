<!--/////////////////////This is for resetting the database values//////////////////////////// -->
<?php
include("connect.php");

 $result=mysql_query("SELECT * FROM nominees ");
 $zero=0;
  mysql_query("UPDATE `nominees` SET counter=0 ");
  mysql_query("UPDATE `students` SET counter=0 , date_voted='' ");  
  mysql_close($con);
?>
<!--/////////////////////This is for resetting the database values//////////////////////////// -->
