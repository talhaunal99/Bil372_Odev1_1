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
			$silSorgusu="DELETE FROM organisations WHERE ORG_ID='$id'";
			$restart= "ALTER TABLE organisations AUTO_INCREMENT=1";
			if(mysqli_query($baglanti, $silSorgusu)) {
				mysqli_query($baglanti, $restart);
			    echo "Kayıt silindi. <a href='organisation_interface.php'>Geri dön</a>";
				
			}
		}
	?>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>
</html>