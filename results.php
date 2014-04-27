<?php
include("header.php");

?>

<?php
//if(isset($_POST['results']) && isset($_SESSION['rollnumber']) && isset($_SESSION['password']))
 //{
 echo logout();
 welcome();
 $result=mysql_query("select post, post_id from posts where valid = 1 order by post");
 echo '<center><font size=9 color=green >Congratulations to all the winners!</font><br />';
 echo "<font size=6 >Election Results</font><table class=results ><tr class=head ><th align=center>Post</th><th align=center >Elected</th><th align=center >Result</th></tr>";
 $counter=0;
 while($row=mysql_fetch_array($result))
  {
   $result1=mysql_query("SELECT fullname, counter, rollnumber, counter from nominees WHERE post_id='$row[post_id]' and activate=1 ");
   $maximum=0;
   $modified=0;
    $p_active=0;
   while($row1=mysql_fetch_array($result1))
    {
	 $p_active=1;
	 
     if($modified==0)
      {
	   $s_maximum=$maximum;
       $name=$row1[fullname];
       $maximum=$row1[counter];
       $modified=1;
	  }
     else
      {
	   if($row1[counter]>$maximum)
	    {
		 $s_maximum=$maximum;
	     $maximum=$row1[counter];
	     $name=$row1[fullname];
	     $modified=1;
	    }
	   else if($row1[counter]==$maximum)
	    {
		 $modified=-1;
	    }
	   else
	    {
		 $s_maximum=$row1[counter];
		}
	  }
    }
    if($p_active==1)
	 {
	  $counter++;
   if($modified==1)
    {
	 $votes=$maximum-$s_maximum;
     echo "<tr class=row ><td align=left id=post >".$counter.". ".$row[post]."</td><td align=center id=result >".$name."</td><td align=right id=votes > won by <font color=black >".$votes."</font> ";
	 if($votes>1)
	  echo "votes";
	 else
	  echo "vote";
	 echo "</td></tr>";
    }
   else
    {
     echo "<tr class=row ><td align=left id=post  >".$counter.". ".$row[post]."</td><td align=center id=none  >None</td><td align=right id=unknown >Tied!</td></tr>";
    }
	 }
  }//end of while
echo "</table></center>";
//}//end of if

//else//Display a message saying to login if attempted to access the page without login
//{
  //br(7);
  //echo "<center><font size=5 >Please </font><font size=6 color=green><a href=index.php >login</a></font><font size=5> to continue...</font></center>";
//}


require("footer.php");
?>
</body>
</html>