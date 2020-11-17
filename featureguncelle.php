<!DOCTYPE html>
<html>
<head>
  <title>Veritabanı Yönetimi - Güncelle</title>
  <meta charset="UTF-8">
</head>
<header>
	<?php
		include 'connection.php';
	?>
</header>
<body>
	<?php
		$id="";
		if(isset($_GET['id'])){
			$id=$_GET['id'];
			if(isset($_POST['submit'])){
				$FEATURE_NAME=$_POST['FEATURE_NAME'];
				$guncelleSorgusu = mysqli_query($mysqli,"UPDATE `features` SET `FEATURE_NAME`='$FEATURE_NAME' WHERE `FEATURE_ID`='$id'");
				if($guncelleSorgusu){
					echo "Kayıt güncellendi. 
					<a href='feature_interface.php'>Geri dön</a><br><br>";
				}
			}
		}
		$A= mysqli_query($mysqli,"SELECT `FEATURE_ID`,`FEATURE_NAME` FROM `features` WHERE `FEATURE_ID`='$id'");
		$kayit=mysqli_fetch_array($A);
	?>
	<form method="POST" action="" >
		  FEATURE NAME: <input type="text" name="FEATURE_NAME" value="<?php echo $kayit['FEATURE_NAME']; ?>" /><br />><br>
		<br />
		<input type="submit" name="submit" value="Güncelle" />
		<br><a href='index.php'>Ana menüye geri dön</a>
	</form>
</body>
</html>