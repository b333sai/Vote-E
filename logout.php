<?php
include("header.php");
?>
<?php
if(isset($_POST['logout']))
{
  session_destroy();
  echo '<meta http-equiv="refresh" content="0;index.php" >';
}
?>