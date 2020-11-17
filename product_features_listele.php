<!DOCTYPE html>
<html>
<head>
  <title>Veritabanı Yönetimi - Listele</title>
  <meta charset="UTF-8">
</head>
<header>
	<?php
		include 'connection.php';
	?>
</header>
<body>
	<?php 
		$sorgu = "SELECT * FROM `product_features`";
		$sorguSonucu = mysqli_query($mysqli, $sorgu) or trigger_error("Hata: ". mysqli_error($mysqli), E_USER_ERROR);
		if($sorguSonucu) {
			echo "<table border='1px' >";
			while($kayit = mysqli_fetch_assoc($sorguSonucu)) {
				echo "<tr><td>" . $kayit ['M_SYSCODE'] . "</td><td>" . $kayit ['FEATURE_ID'] ."<td><td>" . $kayit ['MINVAL'] . "<td><td>"  . $kayit ['MAXVAL'] . "<td><td>";

			}
		}
		echo "</table>";
	?>
	<br><a href='add_feature_to_product.php'>Ürünlere özellik ekle</a>
	<br><a href='brand_orgs.php'>Markalari ve ürünlerini görüntüle</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>
</html>