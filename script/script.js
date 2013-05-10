//////This function is for the fading out and in of the welcome text across all the pages////////
$(document).ready(function(){
var j=0.25;
for(var i=1;i<=1;i=i-j)
{
 $("center.welcome").animate({opacity:i},"fast");
 if(i==0.25)
  j=-0.25;
}

for(i=1;i<6;i++)//This statements are for blinking the error message
{
$("font.error").fadeOut("fast");
$("font.error").fadeIn("fast");
}

$(".row:odd").css('background-color', '#aaaaaa');
$(".row:even").css('background-color', '#777777');
});
//////This function is for the fading out and in of the welcome text across all the pages////////




//This function is to change the window location to a different page///////////////////////////
function reg()
{
 window.location="register.php";
}
//This function is to change the window location to a different page///////////////////////////




//This function is called when login and register attempt is made and to validate the values/////
//Same function is used to validate both the events
var value;
function check(value)//The value of 'value' determines whether it is login or register
{
  var pass=document.forms[0].password.value;
  var roll=document.forms[0].rollnumber.value.toLowerCase();
  var group=roll.substring(0,3);
  var year=roll.substring(3,5);
  var graduation=roll.substring(5,6);
  var zero=roll.substring(6,7);
  var number=roll.substring(7,9);
  number=parseInt(number);
  if(value==1)//If value of 'value'=1 then validate registration details
   {
    var cpass=document.forms[0].confirmpassword.value;
    if(document.forms[0].fullname.value=="" || (/^[a-zA-Z- ]*$/.test(document.forms[0].fullname.value) == false) )
     {
      alert("Invalid Fullname!"+document.forms[0].fullname.value);
      document.forms[0].fullname.value="";
      document.forms[0].fullname.focus();
      return false;
     }
    else if(document.forms[0].gender.value==-1)
     {
      alert("Please select the gender!");
      document.forms[0].gender.focus();
      return false;
     }
    else
     {
      ;
     }
   }
//This will be executed no matter whether it is a login or registration//////////////////////////
 if(roll.length !=9 || (group!="coe" && group!="edm" && group!="mdm" && group!="cds" && group!="eds" && group!="mds" && group!="mat" && group!="phy" ) || (graduation!="b" && graduation!="m" && graduation!="d") || (year!="09" && year!="10" && year!="11" && year!="12" && year!="13") || (zero!="0"))
  {
   alert("Invalid rollnumber!");
   document.forms[0].rollnumber.value="";
   document.forms[0].rollnumber.focus();
   return false;
  }
 if(group=="coe" || group=="edm" || group=="mdm")
  {
   if(graduation!="b" && graduation!="d")
    {
     alert("Invalid rollnumber!");
     document.forms[0].rollnumber.value="";
     document.forms[0].rollnumber.focus();
     return false;	
	}
  }
 if(group=="mat" || group=="phy")
  {
   if(graduation!="d")
    {
     alert("Invalid rollnumber!");
     document.forms[0].rollnumber.value="";
     document.forms[0].rollnumber.focus();
     return false;	 
	}
  }
 if(group=="cds" || group=="eds" || group=="mds")
  {
   if(graduation!="m")
    {
     alert("Invalid rollnumber!");
     document.forms[0].rollnumber.value="";
     document.forms[0].rollnumber.focus();
     return false;	
	}   
  }
  
 if(pass.length<9 || pass.length>15 || pass=="")
  {
   alert("Password not within the range!");
   document.forms[0].password.value="";
   if(value==1)
    document.forms[0].confirmpassword.value="";
   
   document.forms[0].password.focus();
   return false;
  }

   if(value==1)
    {
     if(cpass.length<9 || cpass.length>15 || cpass=="" || cpass!=pass)
      {
       alert("Passwords doesn't match!");
       document.forms[0].password.value="";
       document.forms[0].confirmpassword.value="";
       document.forms[0].password.focus();
       return false;
      }
	 else
	  return true;	 
	}
return true;
}
//This function is called when login and register attempt is made and to validate the values/////





////////////This is called when the submit button of voting form is clicked//////////////////
function checkip()
{
 var retval=confirm("Please check whether you have voted for all the categories. Do you wish to continue? ");
 return retval;
}
////////////This is called when the submit button of voting form is clicked//////////////////