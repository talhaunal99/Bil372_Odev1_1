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
		$sorgu = "SELECT brand_orgs.BRAND_BARCODE, LOT_ID,organisations.ORG_ID,ORG_NAME,UNIT,EXPIRY_DATE,`IN`,`OUT`,QUANTITY,product_brands.BRAND_NAME FROM `brand_orgs`,product_brands,organisations WHERE brand_orgs.BRAND_BARCODE=product_brands.BRAND_BARCODE and brand_orgs.ORG_ID=organisations.ORG_ID";
		$sorguSonucu = mysqli_query($mysqli, $sorgu) or trigger_error("Hata: ". mysqli_error($mysqli), E_USER_ERROR);
		if($sorguSonucu) {
			echo "<table border='1px' >";
			while($kayit = mysqli_fetch_assoc($sorguSonucu)) {
				echo "<tr><td>" . $kayit ['LOT_ID'] . "</td><td>" . $kayit ['ORG_ID'] ."<td><td>" . $kayit ['ORG_NAME'] . "<td><td>"  . $kayit ['UNIT'] . "<td><td>"  . $kayit ['EXPIRY_DATE'] . "<td><td>"  . $kayit ['IN'] . "<td><td>"  . $kayit ['OUT'] . "<td><td>"  . $kayit ['QUANTITY'] . "<td><td>"  .$kayit ['BRAND_NAME'] . "<td><td>" ; 
				
			}
		}
		echo "</table>";
	?>
	<br><a href='brand_orgs_add.php'>Organizasyonla yönet</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>
</html>