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
		$sorgu = "SELECT m.MANUFACTURER_ID, m.MANUFACTURER_NAME, m.MANUFACTURER_ADDRESS, c.COUNTRY_NAME, cc.City_Name from manufacturers m, country c, country_city cc where m.COUNTRY_CODE = c.COUNTRY_CODE and m.CITY_CODE=cc.CityID";
		$sorguSonucu = mysqli_query($mysqli, $sorgu) or trigger_error("Hata: ". mysqli_error($mysqli), E_USER_ERROR);
		if($sorguSonucu) {
			echo "<table border='1px' >";
			while($kayit = mysqli_fetch_assoc($sorguSonucu)) {
			echo "<tr><td>" . $kayit ['MANUFACTURER_ID'] . "</td><td>" . $kayit ['MANUFACTURER_NAME'] ."<td><td>" . $kayit ['MANUFACTURER_ADDRESS'] . "<td><td>"  .$kayit ['COUNTRY_NAME'] . "<td><td>"  . $kayit ['City_Name'] . "<td><td>"  .
			"<td><a href='manufacturer_guncelle.php?id=".$kayit['MANUFACTURER_ID']."'>Düzenle</a></td>" . "<td>
			<a href='manufacturer_sil.php?id=". $kayit['MANUFACTURER_ID']."'>Kaldır</a></td></tr>";	
			}
		}
		echo "</table>";
	?>
	<br><a href='add_manufacture.php'>Yeni kayıt ekle</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>
</html>