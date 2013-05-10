<?php
include("header.php");
?>

<?php
if(isset($_POST['results']) && isset($_SESSION['rollnumber']) && isset($_SESSION['password']))
 {
	$result=mysql_query("SELECT * FROM students WHERE rollnumber='$_SESSION[rollnumber]'");
	$row=mysql_fetch_array($result);
	
	echo "Hello, <font size=4 color=green >".$row[fullname]."</font> ".logout();
 welcome();
 $result=mysql_query("SELECT  * FROM posts ");
 echo "<center><table class=results ><font size=6 >Election Results</font><tr class=head ><th align=center>Post</th><th align=center >Elected</th><th align=center >Votes</th></tr>";
 while($row=mysql_fetch_array($result))
  {
   $result1=mysql_query("SELECT * FROM nominees WHERE post='$row[post]' and activate=1 ");
   $maximum=0;
   $modified=0;
   while($row1=mysql_fetch_array($result1))
    {
     if($modified==0)
      {
       $name=$row1[fullname];
       $maximum=$row1[counter];
       $modified=1;
	  }
     else
      {
	   if($row1[counter]>$maximum)
	    {
	     $maximum=$row1[counter];
	     $name=$row1[fullname];
	     $modified=1;
	    }
	   else if($row1[counter]==$maximum)
	    {
		 $modified=-1;
	    }
	  }
    }
   if($modified!=-1)
    {
     echo "<tr class=row ><td align=left id=post >".$row[post]."</td><td align=center id=result >".$name."</td><td align=right id=votes >".$maximum."</td></tr>";
    }
   else
    {
     echo "<tr class=row ><td align=left id=post  >".$row[post]."</td><td align=center id=none  >None</td><td align=right id=unknown >Tied!</td></tr>";
    }
  }//end of while
echo "</table></center>";
}//end of if

else//Display a message saying to login if attempted to access the page without login
 {
  br(7);
  echo "<center><font size=5 >Please </font><font size=6 color=green><a href=index.php >login</a></font><font size=5> to continue...</font></center>";
 }
?>
</body>
</html>