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
		$sorgu = "SELECT * FROM organisations";
		$sorguSonucu = mysqli_query($mysqli, $sorgu) or trigger_error("Hata: ". mysqli_error($mysqli), E_USER_ERROR);
		if($sorguSonucu) {
			echo "<table border='1px' >";
			while($kayit = mysqli_fetch_assoc($sorguSonucu)) {
echo "<tr><td>" . $kayit ['ORG_ID'] . "</td><td>" . $kayit ['ORG_NAME'] ."<td><td>" . $kayit ['PARENT_ORG'] . "<td><td>"  . $kayit ['ORG_ABSTRACT'] . "<td><td>"
. $kayit ['ORG_ADDRESS'] . "<td><td>" . $kayit ['ORG_CITY'] . "<td><td>". $kayit['ORG_DISTRICT'] . "<td><td>" .  $kayit ['ORG_TYPE'] . "<td><td>" . "<td><a href='guncelle.php?id=".$kayit ['ORG_ID']."'>Düzenle</a></td>" . "<td>
<a href='sil.php?id=". $kayit['ORG_ID']."'>Kaldır</a></td></tr>";	
			}
		}
		echo "</table>";
	?>
	<br><a href='ekle.php'>Yeni kayıt ekle</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>
</html>