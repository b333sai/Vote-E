<?php
include("header.php");
?>

<?php
echo "<div id=container>";
 welcome();//welcome message
 //error_reporting(E_ALL ^ E_NOTICE);
if(isset($_POST["register_w"]))//update the details only when the register button is clicked
 {
  $fullname=strtolower(($_POST["fullname"]));
  $rollnumber =strtolower(($_POST['rollnumber']));
  $password=$_POST['password'];
  $gender=strtolower($_POST['gender']);
  $confirmpassword=($_POST['confirmpassword']);
  $copy_password=md5($password);
  
  $result= mysql_query("SELECT rollnumber FROM students WHERE rollnumber = '$rollnumber' ");
  $next=1;
  while($row = mysql_fetch_array($result))
   {
	$next=0;
	echo "<center><font class=error >Sorry!!! This rollnumber is already registered</font></center>";
	echo form();//To display the registration form
   }
  $result= mysql_query("SELECT password FROM students WHERE password='$copy_password' ");
  while($row = mysql_fetch_array($result) && $next==1)
   {
	$next=0;
	echo "<font class=error ><center>Sorry!!! This password already exists</center></font>";
	echo form();
   }
  
//This block will insert the student details into the database////////////////////////////////// 
  if($next==1)//proceed only if the details are not replica of an old record
   {
	$group_1=substr($rollnumber,0,1);
	$year=substr($rollnumber,3,2);
	$arr=array($group_1,$year);
	$groupid=join($arr);
	$password = md5($_POST['password']);
	$confirmpassword = md5($_POST['confirmpassword']);
	$fullname=strtolower($fullname);
	$rollnumber=strtolower($rollnumber);
	$date_created=p_time(time());
	
	mysql_query("INSERT INTO `students` SET fullname='$fullname',rollnumber='$rollnumber',password='$password',counter='0',gender='$gender',group_id='$groupid',date_created='$date_created'  ");//inserting the student details into database
	echo br(3);
	echo "<center><font size=6 color=green >You have been successfully registered!!!</font></center>";//success message
	echo br(2);
	echo "<center><a href=index.php alt=loginpage ><font color=green size=5>Login</font></a><font size=4> to continue</font></center>";
	mysql_close($con);
   }
//This block will insert the student details into the database///////////////////////////////////

 }//end of if
 else
 {
 echo reg_form();//display form if its the first time visit to this page
 }
?>
</div>
</body>
</html>