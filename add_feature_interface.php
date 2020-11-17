<!DOCTYPE html>
<html>
<head>
  <title>Veritabanı Yönetimi - Ekle</title>
  <meta charset="UTF-8">
</head>
   <header>
	<?php
		include 'connection.php';
	?>
   </header>
   <body>
	<?php
		if(isset($_POST['submit'])){
			$FEATURE_NAME=$_POST['FEATURE_NAME'];
			$sql = "INSERT INTO `features`(`FEATURE_ID`, `FEATURE_NAME`) VALUES (NULL,'$FEATURE_NAME')";
			if($mysqli->query($sql) == TRUE){
				
			} else {
				echo $mysqli->error;
			}
		}
	?>
	<form method="POST" action="">
	      FEATURE NAME: <input type="text" name="FEATURE_NAME"><br>
	     <br>
	     <input type="submit" name="submit" value="Ekle">
	</form>
	<br><a href='feature_interface.php'>Ozelliklere geri don</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
   </body>
</html>