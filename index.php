<?php
include("header.php");
?>
<?php

if(isset($_POST['login']))//this is to check whether login is done or not
{
 if(!(isset($_SESSION['rollnumber'])) && !(isset($_SESSION['password'])))
  {//to initialize the session variables
    $r=$_POST['rollnumber'];
    $p=md5($_POST['password']);
    $result=mysql_query("SELECT * from students WHERE rollnumber='$r' and password='$p' ");
	$true=0;
	while($row=mysql_fetch_array($result))
	 {
      $_SESSION['rollnumber']=$_POST['rollnumber'];
	  $_SESSION['password']=$_POST['password'];
	  $_SESSION['counter']=1;
	  $true=1;
	 }
	if($true!=1)
	 {
	  echo "<center><font size=5 color=red class=error >Invalid information</font></center>";
      echo "<center>(Please check the case in which your password is...)</center>";
	 }
  }
}
if((isset($_SESSION['rollnumber'])) && (isset($_SESSION['password'])))
{
 if(isset($_POST['submit_r']))//this is to check whether submit in voting form is clicked or not
  {
    logout();
    if($_SESSION['counter']==1)
     {
      $arr1=array($_POST['StudentGeneralSecretary'] , $_POST['Co-CurricularAffairsSecretary'] , $_POST['CulturalAffairsSecretary'] , $_POST['HostelAffairsSecretary'] , $_POST['InstituteSportsSecretary'] , $_POST['AcademicAffairsSecretary'], $_POST['ResearchAffairsSecretary'] , $_POST['IIndyearMDesClassCouncillor'] , $_POST['IstyearMDesClassCouncillor'] , $_POST['IstyearBTechClassCouncillor'],  $_POST['PhDClassCouncillor'] ,$_POST['BoysHostelGeneralSecretary'] , $_POST['BoysHostelTechnicalAffairsSecretary'] ,$_POST['BoysHostelGardenSecretary'] ,$_POST['BoysHostelLiterarySecretary'] ,$_POST['BoysHostelSocialSecretary'] ,$_POST['BoysHostelSportsSecretary'] ,$_POST['BoysHostelMessSecretary'] ,$_POST['BoysHostelAlumniAffairsSecretary'] , $_POST['GirlsHostelGeneralSecretary'] ,$_POST['GirlsHostelGardenSecretary'] , $_POST['GirlsHostelTechnicalAffairsSecretary'] ,$_POST['GirlsHostelLiterarySecretary'] ,$_POST['GirlsHostelAlumniAffairsSecretary'] ,$_POST['GirlsHostelSocialSecretary'] ,$_POST['GirlsHostelMessSecretary'] ,$_POST['GirlsHostelSportsSecretary'] , $_POST['COEBranchCouncillor'] , $_POST['EDMBranchCouncillor'] , $_POST['MDMBranchCouncillor'] );

      $arr2=array("Student General Secretary" , "Co-Curricular Affairs Secretary" , "Cultural Affairs Secretary" ,"Hostel Affairs Secretary" , "Institute Sports Secretary" , "Academic Affairs Secretary" ,"Research Affairs Secretary", "IInd year M.Des Class Councillor" , "Ist year M.Des Class Councillor" , "Ist year B.Tech Class Councillor",  "Ph.D. Class Councillor" ,"Boys Hostel General Secretary" , "Boys Hostel Technical Affairs Secretary" ,"Boys Hostel Garden Secretary" ,"Boys Hostel Literary Secretary" ,"Boys Hostel Social Secretary" ,"Boys Hostel Sports Secretary" ,"Boys Hostel Mess Secretary" ,"Boys Hostel Alumni Affairs Secretary" , "Girls Hostel General Secretary" ,"Girls Hostel Garden Secretary" , "Girls Hostel Technical Affairs Secretary" ,"Girls Hostel Literary Secretary" ,"Girls Hostel Alumni Affairs Secretary" ,"Girls Hostel Social Secretary" ,"Girls Hostel Mess Secretary" ,"Girls Hostel Sports Secretary" , "COE Branch Councillor", "EDM Branch Councillor" ,"MDM Branch Councillor" );
      $result=mysql_query("SELECT * FROM students WHERE rollnumber='$_SESSION[rollnumber]'");
	  while($row=mysql_fetch_array($result))
	   {
	    $gen=$row[gender];
	   }
	  $batch=substr($_SESSION['rollnumber'],5,1);
	  $proceed=1;
	  if($batch=="b")
	   {
	    if($arr1[6]!=0 || $arr1[7]!=0 || $arr1[8]!=0 || $arr1[10]!=0)
		 {
		  erraneous();
		  $proceed=0;
		  session_destroy();
		 }
	   }
	  else if($batch=="m")
	   {
	    if($arr1[6]!=0 || $arr1[9]!=0 || $arr1[10]!=0 || $arr1[27]!=0 || $arr1[28]!=0 || $arr1[29]!=0)
		 {
		  erraneous();
		  session_destroy();
		  $proceed=0;		  
		 }	    
	   }
	  else
	   {
	    if($arr1[5]!=0 || $arr1[7]!=0 || $arr1[8]!=0 || $arr1[9]!=0 || $arr1[27]!=0 || $arr1[28]!=0 || $arr1[29]!=0)
		 {
		  erraneous();
		  session_destroy();
		  $proceed=0;
		 }
	   }
	  if($proceed==1)
	   {
	  if($gen=="m")
	   {
	    for($i=19;$i<=26;$i++)
		 {
		  if($arr1[$i]!=0)
		   {
		    erraneous();
		    session_destroy();
			$proceed=0;
            break;
		   }
		 }
	   }
	  else
	   {
	    for($i=11;$i<=18;$i++)
		 {
		  if($arr1[$i]!=0)
		   {
		    erraneous();
		    session_destroy();
			$proceed=0;
            break;
		   }		  
		 }	    
	   }
	   }
	  if($proceed==1)
	   {
	  $year=substr($_SESSION['rollnumber'],3,2);
	  if($year!="12" && $proceed==1)
	   {
	    if($arr1[8]!=0 || $arr1[9]!=0)
		 {
		  erraneous();
		  session_destroy();
		  $proceed=0;
		 }
	   }
	  else
	   {
	    if($arr1[7]!=0)
		 {
		  erraneous();
		  session_destroy();
		  $proceed=0;
		 }	   
	   }
	   }
		 if($proceed==1)
		  {
		   update($arr1,$arr2,$_SESSION['rollnumber'],$gen);//updating the value obtained
		  }
     }//end of if
    else
     {
	  vote_error();//displaying the error if already voted
     }		 
  }
 else//when submit is not clicked
  {
   //echo "not submitted";
   logout();
   $rollnumber=strtolower(($_SESSION['rollnumber']));
   $password=$_SESSION['password'];
   $pass=md5($password);

   
   
   
//////////////////////////////////ADMIN////////////////////////////////////////////////////////
//this section is for the admin login to view the results
  $result=mysql_query("SELECT * FROM students WHERE rollnumber='coe11b005' ");
  while($row=mysql_fetch_array($result))
   {
    if($row[rollnumber]==$rollnumber)
	 {
	  echo "Hello, <font size=4 color=brown >Admin</font>!!!";
      echo br(5)."<center><form action=results.php method=post ><input type=submit value=Results name=results /></form></center>";
	  $flag=1;
	 }
   }
/////////////////////////////////////////////////////////////////////////////////////////////



  if($flag!=1)
   {
    $password = md5($password);
    $result = mysql_query("SELECT * FROM students WHERE rollnumber='$rollnumber' ");

    while($row = mysql_fetch_array($result))
     {
      if($rollnumber==$row['rollnumber'])
       {
	    if($row['counter']==1)
	     {
	      vote_error();
	     }
	    else
	     {
	      echo "Hello, <font size=4 color=green >".$row[fullname]."</font> ";
          welcome();
	      echo "<center><font color=#663333 size=40px align=center >List of candidates</font></p><form action=index.php name=candidates method=post onsubmit=return(checkip()) >";
	      echo "<table width=700px cellspacing=0 >";
	      $flag=0;
	      $tmp="0";
          
	      $batch=substr($rollnumber,5,1);
		  $result2= mysql_query("SELECT * from nominees order by post, fullname ");
	      while($row2 = mysql_fetch_array($result2))
	       {
		    if($row2[activate]==1)
			{
	         if($row2[grp_cons]==0 && $row2[gen_cons]==0 && $row2[yer_cons]==0 && $row2[bch_cons]==0 )
	          {
		       $tmp=display($row2,$tmp);
		       $flag=1;
		      }
	         else
	          {
			   $next=0;
               if($row2[bch_cons]==1)
			    {
				 if($batch=="b")
				  {
				   $next=voting_cons($row2,$rollnumber);
				  }
				}
               else if($row2[bch_cons]==2)
			    {
				 if($batch=="b" || $batch=="m")
				  {
				   $next=voting_cons($row2,$rollnumber);
				  }
				}
               else if($row2[bch_cons]==3)
			    {
				 if($batch=="m")
				  {
				   $next=voting_cons($row2,$rollnumber);
				  }
				}
               else if($row2[bch_cons]==4)
			    {
				 if($batch=="d")
				  {
				   $next=voting_cons($row2,$rollnumber);
				  }
				}
               else
			    {
				   $next=voting_cons($row2,$rollnumber);
				}
               if($next==1)
                {
		         $tmp=display($row2,$tmp);
		         $flag=1;
                }
		      }
            }
	       }//end of 'while' which displays the nominees list	 
	       echo "<tr><td><hr color=white ></td><td><hr color=white ></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>";
	       echo "<tr><td align=center><input type=submit name=submit_r value=Submit class=submit /></td><td align=left><input type=reset name=reset value=Reset class=reset  /></td></tr></table></form></center>";
	   }//end of else which displays form if he has not voted
	
      }//end of 'if' if the login was successful
     }//end of while which will scan the students data base for the login details

 }//end of 'if' if the user was not admin
  
  }//end of else
     mysql_close($con);
}
else
{
welcome();
echo "<center><b><font size=6 color=black >Student Login</font></b>
<form action=index.php method=post onsubmit=return(check(0)) ></br>
<table>
<tr><td align=right  class=fields ><strong>Roll Number:</strong></td><td align=left ><input type=text name=rollnumber size=30 /></td></tr>
<tr><td align=right  class=fields ><strong>Password:</strong></td><td align=left ><input type=password name=password  size=30 /></td></tr>
<tr><td></td><td align=center ><input type=submit value=Login name=login /></td></tr></form></table></center>";
}
?>
</div>
</body>
</html>