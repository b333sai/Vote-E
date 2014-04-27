<?php
include("connect.php");
//error_reporting(E_ALL ^ E_NOTICE);
?>

<?php
//This function is for login form
function login()
{
echo '<center><span class=heading >Student Login</span>
<form action=index.php method=post onsubmit=return(check(0)) >
<table>
<tr><td align=left ><input class=inp placeholder="Your roll number..." type=text name=rollnumber maxlength=9 /></td></tr>
<tr><td align=left ><input class=inp placeholder="Your password..." type=password name=password  maxlength=15 /></td></tr>
<tr><td align=center ><input class=btn type=submit value=Login name=login /></td></tr></form></table></center>';
}
//end of login form




//This function is for the welcome message
function welcome()
{
 echo br(1).'<p id="welcome" >Welcome to the Student Elections 2014-15</p>';
}
//This function is for the welcome message


//This function is to introduce breaks in the document
function br($x)
  {
   for($y=0;$y<$x;$y=$y+1)
    {
	 echo "</br>";
	}
  }
//end of break function
 
 
//this functin is to introduce spaces in the document
 function space($x)
  {
   for($y=0;$y<$x;$y=$y+1)
    {
	 echo "&nbsp";
	}
  }
//end of space function

 
//this function is to develop the present day date and time 
 function p_time($date)
  {
   $time=date("d",$date).",".date("F",$date).",".date("Y",$date).", ".date("H",$date).":".date("i",$date).":".date("s",$date);
   return $time;
  }
//end of present time function
 
 
 
 
 
 
 
 
 
 
//this function is to display the candidates for a nomination
 function display($rollnumber, $fullname, $post, $hl, $count)//$tmp stores the post of the previous nominee
  {
   if(!$hl)
     {
	   echo "<tr>";
	   echo "<td class=post align=left colspan=2 >".$count.". ".$post."</td></tr>";
	 }
   echo '<tr><td class=nominee align=left ><input type=radio value='.$rollnumber.' name="'.$post.'" id='.$rollnumber.' /><label for='.$rollnumber.' >&nbsp;'.$fullname.' ('.$rollnumber.')</label></td><td class=nominee ><img src=img/'.$rollnumber.'.jpg alt=nominee class=n_image title='.$rollnumber.' /></td></tr>';
  }
//end of the display function which prints each nominee in the voting list









//this function is to update the voting results in the nominees and students table
 function update($arr1,$arr2,$rollnumber,$gen)
  {
   $next=1;

/////////////$flag IS SET TO 1 FOR SUCCESS AND TO 0 FOR ERROR////////////////////////////////////
/////////////$flag IS SET TO 1 FOR SUCCESS AND TO 0 FOR ERROR////////////////////////////////////

   $flag=1;
   //This will check the repetitions in the values submitted
   for($i=0;$i<=29;$i++)
    {
     for($j=$i+1;$j<=29;$j++)
      {
       if($arr1[$i]==$arr1[$j] && $arr1[$i]!="")
	    {
	     $flag=0;
		 $next=0;
		 break;
	    }
      }
   }
   //This will check the repetitions in the values submitted


  if($next==1)//proceed only when $next value is not changed in the previous module
   {
    for($i=0;$i<=29;$i++)
     {
	 
//This will check whether the values obtained & corresponding posts are presnt in database or not
      if($arr1[$i]!="")
	   {
	    $flag=0;
        $result=mysql_query("SELECT * FROM nominees WHERE rollnumber='$arr1[$i]' and post='$arr2[$i]' and activate=1 ");
	    while($row=mysql_fetch_array($result))
	     {
          $flag=1;
	     }
	   if($flag==0)
	    {
         break;
	    }
	   }//end of if
//This will check whether the values obtained & corresponding posts are presnt in database or not


/////////////FLAG IS SET TO 1 FOR SUCCESS AND TO 0 FOR ERROR////////////////////////////////////
     }//end of for
   }//end of if
   
//This block is executed when the values obtained are true w.r.t to the details
   if($flag==1)
    {
	 for($i=0;$i<=29;$i++)
	  {
       mysql_query("UPDATE `nominees` SET counter=counter+1  WHERE rollnumber='$arr1[$i]' and post='$arr2[$i]' and activate=1 ");//updating the candidates count value
      }
     $v_time=p_time(time());
     mysql_query("UPDATE `students` SET counter=counter+1 , datevoted='$v_time'  WHERE rollnumber='$rollnumber' and counter=0 ");//updating student voting date and counter value
     echo br(7);
     echo "<font size=6 color=green ><center>Thank You!</center></font><font size=5 color=brown ><center>Your results have been submitted succesfully!</center></font>";
	 
	}
//This block is executed when the values obtained are true w.r.t to the details


//This block is executed when the values obtained are false
   else
    {
     echo br(6);
     echo "<font size=6 color=red class=error ><center>Unexpected Error!!!</center></font><font size=5 color=brown ><center>Please <a href=index.php >Login</a> to continue...</center></font>";
	}
//This block is executed when the values obtained are false

  }
//end of the function updates



//This function is to insert a logout button in the document
function logout()
{
echo "<form action=index.php method=post ><input type=submit name=logout value=Logout  class=logout ></form>";
}
//This function is to insert a logout button in the document



//This displays the error if not voted properly
function erraneous()
{
 echo br(13)."<center><font color=red size=6>You have not voted properly!</font></br> Please <a href='index.php' ><font size=5 >Login</font></a> to continue.</center>"; 
} 
//This displays the error if not voted properly



//This function is to validate the registrations details
function student_validations($rollnumber, $password, $confirmpassword, $gender, $fullname)
  {
    $grp=substr($rollnumber, 0, 3);
	$grad=substr($rollnumber, 5, 1);
	$year=substr($rollnumber, 3, 2);
	
    if($password=="" || $confirmpassword=="" || strlen($password)<9 || strlen($password)>15 || strlen($confirmpassword)<9 || strlen($confirmpassword)>15 || $password!=$confirmpassword || $gender==-1 || strlen($rollnumber)!=9 || ($grp!="coe" && $grp!="edm" && $grp!="mdm" && $grp!="cds" && $grp!="eds" && $grp!="mds" && $grp!="mat" && $grp!="phy") || ($grad!="b" && $grad!="m" && $grad!="d" ) || ($year!="10" && $year!="11" && $year!="12" && $year!="13" && $year!="14") || substr($rollnumber, 6, 1)!="0" || $fullname=="")
	  {
	    return 0;
	  }
	else
	  {
	    return 1;
	  }
  }
//This function is to validate the registrations details







//This function is for displaying the registration form
function reg_form()
{
 echo '<center><h1 class=heading >Registration</h1>
 <form action=register.php method=POST onsubmit=return(check(1)) >
 <table>
 <tr>
 <td align=left ><input  class=inp  placeholder="Full Name..." maxlength=51 type=text name=fullname size=33 /></td>
 </tr>
 
 <tr>
 <td align=left ><select  class=inp name=gender >
 <option value=-1 selected >[Gender]</option>
 <option value=m  >male </option>
 <option value=f  >female</option></select></td>
 </tr>
 
 <tr>
 <td align=left ><input class=inp placeholder="Roll Number..." size=15 maxlength=9 minlength=9 type=text name=rollnumber size=33/></td>
 </tr>
 
 <tr>
 <td align=left ><input  class=inp  placeholder="Password..." type=password  maxlength=15 minlength=9 name=password size=20></td>
 </tr>
 
 <tr>
 <td align=left ><font size=3 color=red>(should be between 9 to 15 characters)</font></td>
 </tr>
 
 <tr>
 <td align=left ><input  class=inp  placeholder="Confirm Password..."  maxlength=15 minlength=9 type=password name=confirmpassword size=20></td>
 </tr>
 
 <tr>
 <td><center><input  class=btn type=submit value=Register name=register_w class=register ></center></td>
 </tr>
 </table>
 </form>
 </center>';
}
//This function is for displaying the registration form






///
function check_active($post)
{
$res=mysql_query("SELECT * FROM nominees WHERE post='$post' and activate='1' ");
$row2=mysql_fetch_array($res);
return $row2;
}
///






///This function is for the already voted message////////////////////////////////////////////////
function vote_error()
{
 echo br(7)."<center><font color=red size=6 class=error >You have already voted!</font></center>";
}
///This function is for the already voted message////////////////////////////////////////////////







///this function is for various consideration issues in displaying the voting form
function voting_cons($row,$rollnumber)
{
 $result3= mysql_query("SELECT * from students WHERE rollnumber='$rollnumber' ");
 while($row3 = mysql_fetch_array($result3))
  {
   $gen=$row3[gender];
  }
 $grp=substr($rollnumber,0,3);
 $year=substr($rollnumber,3,2);
 
 $n_grp=substr($row[rollnumber],0,3);
 $n_year=substr($row[rollnumber],3,2);
 $n_gen=$row[gender];
 
 if($row[grp_cons]==1 && $row[gen_cons]==1 && $row[yer_cons]==1)
  {
   if($grp==$n_grp && $gen==$n_gen && $year==$n_year)
    {
	 return 1;
	}
   else
    {
	 return 0;
	}
  }
 else if($row[grp_cons]==1 && $row[gen_cons]==1 && $row[yer_cons]==0)
  {
   if($grp==$n_grp && $gen==$n_gen)
    {
	 return 1;
	}
   else
    {
	 return 0;
	}
  }
 else if($row[grp_cons]==1 && $row[gen_cons]==0 && $row[yer_cons]==1)
  {
   if($grp==$n_grp && $year==$n_year)
    {
	 return 1;
	}
   else
    {
	 return 0;
	}
  }
 else if($row[grp_cons]==1 && $row[gen_cons]==0 && $row[yer_cons]==0)
  {
   if($grp==$n_grp)
    {
	 return 1;
	}
   else
    {
	 return 0;
	}
  }
 else if($row[grp_cons]==0 && $row[gen_cons]==1 && $row[yer_cons]==1)
  {
   if($gen==$n_gen && $year==$n_year)
    {
	 return 1;
	}
   else
    {
	 return 0;
	}
  }
 else if($row[grp_cons]==0 && $row[gen_cons]==1 && $row[yer_cons]==0)
  {
   if($gen==$n_gen)
    {
	 return 1;
	}
   else
    {
	 return 0;
	}
  }
 else if($row[grp_cons]==0 && $row[gen_cons]==0 && $row[yer_cons]==1)
  {
   if($year==$n_year)
    {
	 return 1;
	}
   else
    {
	 return 0;
	}
  }
 else
  {
   return 1;
  }
}
///this function is for various consideration issues in displaying the voting form

?>