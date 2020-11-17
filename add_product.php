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
		$sorgu = "SELECT * FROM `product` ";
		$sorguSonucu = mysqli_query($mysqli, $sorgu) or trigger_error("Hata: ". mysqli_error($mysqli), E_USER_ERROR);
		if($sorguSonucu) {
			echo "<table border='1px' >";
			while($kayit = mysqli_fetch_assoc($sorguSonucu)) {
echo "<tr><td>" . $kayit ['M_SYSCODE'] . "</td><td>" . $kayit ['M_CODE'] ."<td><td>" . $kayit ['M_NAME'] . "<td><td>"  . $kayit ['M_SHORTNAME'] . "<td><td>"
. $kayit ['M_PARENTCODE'] . "<td><td>" . $kayit ['M_ABSTRACT'] . "<td><td>". $kayit['M_CATEGORY'] . "<td><td>" .  $kayit ['IS_ACTIVE'] . "<td><td>" . "<td><a href='guncelle.php?id=".$kayit ['M_SYSCODE']."'>Düzenle</a></td>" . "<td>
<a href='sil.php?id=". $kayit['M_SYSCODE']."'>Kaldır</a></td></tr>" ;	
			}
		}
		echo "</table>";
	?>
	<br><a href='add_product_interface.php'>Yeni kayıt ekle</a>
	<br><a href='brand_orgs.php'>Markalari ve ürünlerini görüntüle</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>
</html>