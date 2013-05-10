<!--/////////////////////This is for resetting the database values//////////////////////////// -->
<?php
include("connect.php");

 $result=mysql_query("SELECT * FROM nominees ");
 $zero=0;
 while($row = mysql_fetch_array($result))
  {
  mysql_query("UPDATE `nominees` SET counter=0 ");
  }
  $result=mysql_query("SELECT * FROM students ");
  while($row=mysql_fetch_array($result))
   {
   mysql_query("UPDATE `students` SET counter=0 , datevoted='' ");  
   }
  mysql_close($con);
?>
<!--/////////////////////This is for resetting the database values//////////////////////////// -->
