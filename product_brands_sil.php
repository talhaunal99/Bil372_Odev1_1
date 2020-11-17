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
		if(isset($_GET['barcode'])& isset($_GET['syscode'])){
			$BRANDBARCODE=$_GET['barcode'];
			$SYSCODE=$_GET['syscode'];
			$silSorgusu="DELETE FROM product_brands WHERE BRAND_BARCODE='$BRANDBARCODE' AND M_SYSCODE='$SYSCODE'";
			if(mysqli_query($mysqli, $silSorgusu)) {
			    echo "Kayıt silindi. <a href='product_brands_listele.php'>Geri dön</a>";
			}
		}
	?>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>
</html>