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
				$M_CODE=$_POST['M_CODE'];
				$M_NAME=$_POST['M_NAME'];
				$M_SHORTNAME=$_POST['M_SHORTNAME'];
				$M_PARENTCODE=$_POST['M_PARENTCODE'];
				$M_ABSTRACT=$_POST['M_ABSTRACT'];
				$M_CATEGORY=$_POST['M_CATEGORY'];
				$IS_ACTIVE=$_POST['IS_ACTIVE'];
				$guncelleSorgusu = mysqli_query($mysqli,"UPDATE `product` SET `M_CODE`='$M_CODE',`M_NAME`='$M_NAME',`M_SHORTNAME`='$M_SHORTNAME',`M_PARENTCODE`='$M_PARENTCODE', `M_ABSTRACT`='$M_ABSTRACT', `M_CATEGORY`='$M_CATEGORY', `IS_ACTIVE`='$IS_ACTIVE' WHERE M_SYSCODE='$id'");
				if($guncelleSorgusu){
					echo "Kayıt güncellendi. 
					<a href='add_product.php'>Geri dön</a><br><br>";
				}
			}
		}
		$A= mysqli_query($mysqli,"SELECT * FROM `product` WHERE M_SYSCODE='$id'");
		$kayit=mysqli_fetch_array($A);
	?>
	<form method="POST" action="" >
		CODE: <input type="text" name="M_CODE" value="<?php echo $kayit['M_CODE']; ?>" /><br />><br>
	      NAME: <input type="text" name="M_NAME" value="<?php echo $kayit['M_NAME']; ?>" /><br />><br>
		  SHORT NAME: <input type="text" name="M_SHORTNAME" value="<?php echo $kayit['M_SHORTNAME']; ?>" /><br />><br>
		  PARENT CODE: <input type="text" name="M_PARENTCODE" value="<?php echo $kayit['M_PARENTCODE']; ?>" /><br />><br>
		  IS ABSTRACT: <input type="dechex" name="M_ABSTRACT" value="<?php echo $kayit['M_ABSTRACT']; ?>" /><br />><br>
		  CATEGORY: <input type="text" name="M_CATEGORY" value="<?php echo $kayit['M_CATEGORY']; ?>" /><br />><br>
		  ACTIVE: <input type="dechex" name="IS_ACTIVE" value="<?php echo $kayit['IS_ACTIVE']; ?>" /><br />><br>
		<br />
		<input type="submit" name="submit" value="Güncelle" />
		<br><a href='index.php'>Ana menüye geri dön</a>
	</form>
</body>
</html>