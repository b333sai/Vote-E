<?php
include("header.php");
?>
<?php
echo "<div id=container >";
welcome();
echo "<center><font size=6 color=blue >Results</font>";
echo "<center><table class=results ><tr class=head ><th align=center >Post</th><th align=center >Nominees</th><th align=center >Votes</th></tr>";
$result=mysql_query("SELECT * FROM nominees ");
$pst1="";
$pst2="";
while($row=mysql_fetch_array($result))
 {
   $pst1=$pst2;
   $pst2=$row[post];
   if($row[activate]==1)
   {
  if($pst1!=$pst2 && $pst1=="")
   {
    echo "<tr class=main_nominee ><td id=post >".$row[post]."</td><td id=result align=left>".$row[fullname]."</td><td align=center id=votes  >".$row[counter]."</td></tr>";
   }
  else if($pst2!=$pst1)
   {
    echo "<tr class=main_nominee ><td id=post >".$row[post]."</td><td id=result align=left>".$row[fullname]."</td><td id=votes align=center >".$row[counter]."</td></tr>";
   }
  else
   {
    echo "<tr class=nominee ><td></td><td id=result align=left >".$row[fullname]."</td><td align=center id=votes  >".$row[counter]."</td></tr>";
   }
   }

 }
 echo "</table></center>";
?>

</div>
</body>
</html>
