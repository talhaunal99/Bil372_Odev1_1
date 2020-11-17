<!DOCTYPE html>
<html>
<head>
  <title>Veritabanı Yönetimi - Sil</title>
  <meta charset="UTF-8">
</head>
<header>
	<?php
		include 'connection.php';
	?>
</header>
<body>
	<?php 
		if(isset($_GET['id'])){
			$id=$_GET['id'];
			$silSorgusu="DELETE FROM `features` WHERE FEATURE_ID='$id';";
			$restart="ALTER TABLE `features` AUTO_INCREMENT=1";
			if(mysqli_query($mysqli, $silSorgusu)) {
				$sql=mysqli_query($mysqli,$restart);
			    echo "Kayıt silindi. <a href='feature_interface.php'>Geri dön</a>";
			}
		}
	?>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>
</html>