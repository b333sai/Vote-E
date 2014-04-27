<?php
include("header.php");
?>


<title>Student Elections 2014</title>



<?php
if(isset($_POST['logout']))
 {
if(isset($_SESSION['rollnumber']))
{
 session_destroy();
 echo '<meta http-equiv="refresh" content="0;index.php" >';
}
 }
 
 
if(isset($_POST['login']))//this is to check whether login is done or not
{
 if(!(isset($_SESSION['rollnumber'])))
  {//to initialize the session variables
    //echo $_POST['rollnumber'];
	//echo $_POST['password'];
    $r=strtoupper($_POST['rollnumber']);
    $p=($_POST['password']);
	
    $result=mysql_query("SELECT * from students WHERE rollnumber='$r' and password='$p' ");
	$count=mysql_num_rows($result);


	if($count)
	 {
      $_SESSION['rollnumber'] = strtoupper($_POST['rollnumber']);
	  $_SESSION['password'] = $_POST['password'];
	  $_SESSION['counter'] = 1 ;
	 }
	else
	 {
	  echo "<center><font size=5 color=red class=error >Username and Password mismatch!!!</font></center>";
      echo "<center>(Please check the case in which your password is...)</center>";
	 }
  }
}
if((isset($_SESSION['rollnumber'])))
{
 if(isset($_POST['submit_r']))//this is to check whether submit in voting form is clicked or not
  {
    if($_SESSION['counter']==1)
     {
      $proceed=1;
	  $posts=explode("|", $_SESSION['posts']);
	  $v_time=p_time(time());
	  $query2="update students set counter=1  , date_voted='$v_time' where rollnumber = '$_SESSION[rollnumber]'";
	  //$pre="";
	  /*foreach($posts as $post => $value)
	    {
		  //echo "<br /> post: ".$value;

		  //echo "<br />Value got: ".$_POST[$value];
		  $value=str_replace(" ","_",$value);
		  /*if($value=="")
		    {
			  echo 'hi';
			  erraneous();
			  session_destroy();
			  $proceed=0;
			  break;
		    }
		  if($pre!="" && $_POST[$value]==$pre)
		    {
			  echo 'hello';
			  erraneous();
			  session_destroy();
			  $proceed=0;
			  break;
			}
		  $pre = $_POST[$value];
		}*/
		
		
	  if($proceed)
	    {
		  foreach($posts as $post =>$value)
		  {
		    $value=str_replace(" ","_",$value);
			//echo "<br />Post: ".$value;
			//echo "<br />".$_POST[$value];
		    if($value!="" && $_POST[$value]!="" )
		      {
			  $value=str_replace("_"," ",$value);
			  $select1=mysql_query("select post_id from posts where post='$value'");
			  $value=str_replace(" ","_",$value);
			  $select2=mysql_query("select post_id from nominees where rollnumber='$_POST[$value]'"); 
			  $row1=mysql_fetch_array($select1);
			  $row2=mysql_fetch_array($select2);
			  
              //echo "<br />Post Id1: ".$row1[post_id];
			  //echo "<br />Post Id2: ".$row2[post_id];
			  if($row2[post_id]=="" || ($row1[post_id]!=$row2[post_id]) || $row1[post_id]=="" )
			   {
			     //echo 'hi 2';
			     erraneous();
				 session_destroy();
				 $proceed=0;
				 break;
			   }
			  if($proceed==0)
			   break;
			 } 
		  }
		}
	  if($proceed)
	   {
	  logout();
	  echo "Hello, <font size=4 color=green >".$_SESSION['fullname']."</font> ";
		  foreach($posts as $post =>$value)
		  {
		    if($value!="")
		      {
			   $value=str_replace(" ","_",$value);
			   mysql_query("update nominees set counter=counter+1 where rollnumber='$_POST[$value]'");
			   mysql_query($query2);
			   $_SESSION['counter']=0;
			 }
		  }
		 echo '<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><h1 style="text-align:center;" >Thank you for your valuable choices!!!</h1>';
	   }
     }//end of if
    else
     {
	  vote_error();//displaying the error if already voted
	  session_destroy();
	  echo "<br /><br /><br /><div style='text-align:center;' ><a href=index.php alt='registration page' ><font color=green size=5>Login</font></a></div>";
     }
  }
 else//when submit is not clicked
  {
   //echo "not submitted";
   $rollnumber=$_SESSION['rollnumber'];
   $password=$_SESSION['password'];
   $pass=($password);


//////////////////////////////////ADMIN////////////////////////////////////////////////////////
//this section is for the admin login to view the results

    //if($rollnumber=="COE11B005" && $password=="admines33314")
	 //{
	  //echo "Hello, <font size=4 color=brown >Admin</font>!!!";
      //echo br(5)."<center><form action=results.php method=post ><input type=submit value=Results name=results /></form></center>";
	// }
/////////////////////////////////////////////////////////////////////////////////////////////



  //else
   {
    $password = ($password);
    $result = mysql_query("SELECT * FROM students WHERE rollnumber='$rollnumber' ");
    $count=mysql_num_rows($result);
    while($row_s = mysql_fetch_array($result))
     {
	    if($row_s['counter']==1)
	     {
	      vote_error();
		  session_destroy();
	  echo "<div style='text-align:center;' ><br /><br /><br /><br /><br /><br /><br /><a href=index.php alt='registration page' ><font color=green size=5>Login</font></a></div>";
	     }
	    else
	     {
		  logout();
		  $_SESSION['fullname']=$row_s[fullname];
	      echo "Hello, <font size=4 color=green >".$row_s[fullname]."</font> ";
          welcome();
	      echo '<center><font color=#663333 size=40px align=center >List of candidates</font></p><form action=index.php name=candidates method=post >';
		  
		  echo "<table width=700px cellspacing=0 >";
		  $select=mysql_query("select * from posts order by post");
		  $post_count=0;
		  while($row=mysql_fetch_array($select))
		    {
			  if($row[valid]==1)//display only valid posts
			    {
				  $post_name=$row[post];
				  $post_id=$row[post_id];
				  $nominees_count=$row[nominees];
				  //echo $nominees_count;
				  $select_2=mysql_query("select branches_allowed from con_branch where post_id='$post_id'");
				  $proceed=1;
				  
				  
				  
				  
				  
				  
/////////////////////**********************************************************************************///////////
				  if($proceed)//is there any branch consideration for that post
				    {
				      while($row=mysql_fetch_array($select_2))
				        {
						  $branches=explode("|", $row[branches_allowed]);
						  $len=sizeof($branches);
						  for($i=0;$i<$len;$i++)
						    {
					          if(strtoupper($branches[$i])==substr($rollnumber,0,3))//if it satisfies branch requirements
					            {
						          $proceed=1;
								  break;
						        }
						      else
						        {
								  //echo "<br />branch_cons_exist".$post_id;
						          $proceed=0;
						        }
							}
					    }//end of while
					}//end of if for branch considerations
/////////////////////**********************************************************************************///////////








/////////////////////**********************************************************************************///////////
				  if($proceed)//check for any batch consideration for that post
				    {
					  $select_3=mysql_query("select batches_allowed from con_batch where post_id='$post_id'");
					  
				      while($row=mysql_fetch_array($select_3))
				        {
						  $batches=explode("|", $row[batches_allowed]);
						  $len=sizeof($batches);
						  for($i=0;$i<$len;$i++)
						    {
					          if(strtoupper($batches[$i])==substr($rollnumber,5,1))//if it satisfies branch requirements
					            {
						          $proceed=1;
								  break;
						        }
						      else
						        {
								  //echo "<br />batch_cons_exist".$post_id;
						          $proceed=0;
						        }
							}
					    }//end of while
					}//end of if for batch considerations
/////////////////////**********************************************************************************///////////









/////////////////////**********************************************************************************///////////
                  if($proceed)
				    {
					  //echo "<br />proceed to gender_cons".$post_id;
				      $select_3=mysql_query("select gender_allowed from con_gender where post_id='$post_id'");
					  $count=mysql_num_rows($select_3);
				      if($count)//is there any gender consideration for that post
				        {
						  //echo "<br />gender cons exist".$post_id;
					      while($row=mysql_fetch_array($select_3))
						    {
								  if($row[gender_allowed]==$row_s[gender])
								    {
									  $proceed=1;
									}
								  else
								    {
									  $proceed=0;
									}
							}
					    }
				   }
/////////////////////**********************************************************************************///////////








/////////////////////**********************************************************************************///////////
					if($proceed)
					    {
						  //echo "<br />proceed to year_cons".$post_id;
						  $select_5=mysql_query("select years_allowed from con_year where post_id='$post_id' ");
						  $count=mysql_num_rows($select_5);
						  if($count)
						    {
							  while($row=mysql_fetch_array($select_5))
							    {
								  $years=explode("|", $row[years_allowed]);
								  $len=sizeof($years);
								  for($i=0;$i<$len;$i++)
								    {
									  if($years[$i]==substr($rollnumber, 3, 2))
									    {
										  $proceed=1;
										  break;
										}
								      else
									    {
										  //echo "<br />year cons exist".$post_id;
										  $proceed=0;
										}
									}//end of for
								}//end of while
							}//end of if "select_5"
						}//end of if year consideration
/////////////////////**********************************************************************************///////////






                         if($proceed)
						  {
						  $select_6=mysql_query("select rollnumber, fullname from nominees where post_id='$post_id' and activate=1 order by fullname ");
						  $count=mysql_num_rows($select_6);
						  $counter=0;
						  if($count>1)
						    {
							  $post_count++;
							  $posts=$post_name."|".$posts;
						      while($row_final=mysql_fetch_array($select_6))
						       {
							     if($counter==0)
								   {
								     display($row_final[rollnumber], $row_final[fullname], $post_name, 0, $post_count);
									 $counter++;
								   }
								 else
								   {
								    // if($counter>=1)
									  // {
									     display($row_final[rollnumber], $row_final[fullname], $post_name,1, $post_count);
									  // }
									 //else
									   //{
									    // display($row_final[rollnumber], $row_final[fullname], //$post_name, 0, $post_count);
									  // }
									 //$counter--;
								   }
							   }
						    }//end of if "count"
					    echo "<tr><td colspan=2 ><hr color=white></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>";
                        }//try to display posts only if they are eligible to view
                     

						
				}
			}
		  $_SESSION['posts']=$posts;
	      echo "<tr style='height:100px;'><td></td><td></td><td></td></tr>";
	      echo '<tr><td align=center><input type=submit name=submit_r value=Submit class=btn onclick="return(checkip());" /></td><td align=left><input type=reset name=reset value=Reset class=btn  /></td></tr></table></form></center>';
		  echo br(3);

		   
	   }//end of else which displays form if he has not voted
	
     }//end of while which will scan the students data base for the login details

 }//end of 'else' if the user was not admin
  
  }//end of else
     mysql_close($con);
}
else
{
welcome();
login();
}
include("footer.php");
?>

</div>
</body>
</html>