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
			$silSorgusu="UPDATE `product` SET IS_ACTIVE=0";
			if(mysqli_query($mysqli, $silSorgusu)) {
			    echo "Kayıt silindi. <a href='add_product.php'>Geri dön</a>";
			}
		}
	?>
</body>
</html>