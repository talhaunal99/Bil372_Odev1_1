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
		$sorgu = "SELECT `FEATURE_ID`, `FEATURE_NAME` FROM `features` ";
		$sorguSonucu = mysqli_query($mysqli, $sorgu) or trigger_error("Hata: ". mysqli_error($mysqli), E_USER_ERROR);
		if($sorguSonucu) {
			echo "<table border='1px' >";
			while($kayit = mysqli_fetch_assoc($sorguSonucu)) {
echo "<tr><td>" . $kayit ['FEATURE_ID'] . "</td><td>" . $kayit ['FEATURE_NAME'] ."<td><td>". "<td><a href='featureguncelle.php?id=".$kayit ['FEATURE_ID']."'>Düzenle</a></td>" . "<td>
<a href='featuresil.php?id=". $kayit['FEATURE_ID']."'>Kaldır</a></td></tr>";	
			}
		}
		echo "</table>";
	?>
	<br><a href='add_feature_interface.php'>Yeni özellik ekle</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>
</html>