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
		$sorgu = "SELECT * FROM product_brands";
		$sorguSonucu = mysqli_query($mysqli, $sorgu) or trigger_error("Hata: ". mysqli_error($mysqli), E_USER_ERROR);
		if($sorguSonucu) {
			echo "<table border='1px' >";
			while($kayit = mysqli_fetch_assoc($sorguSonucu)) {
				echo "<tr><td>" . $kayit ['BRAND_BARCODE'] . "</td><td>" . $kayit ['M_SYSCODE'] ."<td><td>" . $kayit ['BRAND_NAME'] . "<td><td>"  .
				"<td><a href='product_brands_guncelle.php?barcode=".$kayit['BRAND_BARCODE']."&syscode=".$kayit['M_SYSCODE']."'>Düzenle</a></td>" . "<td>
				<a href='product_brands_sil.php?barcode=". $kayit['BRAND_BARCODE']."&syscode=".$kayit['M_SYSCODE']."'>Kaldır</a></td></tr>";	
			}
		}
		echo "</table>";
	?>
	<br><a href='product_brands_ekle.php'>Yeni kayıt ekle</a>
	<br><a href='brand_orgs.php'>Organizasyonla yönet</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>
</html>