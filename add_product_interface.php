<!DOCTYPE html>
<html>
<head>
  <title>Veritabanı Yönetimi - Ekle</title>
  <meta charset="UTF-8">
</head>
   <header>
	<?php
		include 'connection.php';

	?>
   </header>
   <body>
	<?php
		if(isset($_POST['submit'])){
			//$M_SYSCODE=$mysqli->insert_id;
			$M_CODE=$_POST['M_CODE'];
			$M_NAME=$_POST['M_NAME'];
			$M_SHORTNAME=$_POST['M_SHORTNAME'];
			$M_PARENTCODE=$_POST['M_PARENTCODE'];
			$M_ABSTRACT=$_POST['M_ABSTRACT'];
			$M_CATEGORY=$_POST['M_CATEGORY'];
			$IS_ACTIVE=$_POST['IS_ACTIVE'];
			$sql = "INSERT INTO `product`(`M_SYSCODE`, `M_CODE`, `M_NAME`, `M_SHORTNAME`, `M_PARENTCODE`, `M_ABSTRACT`, `M_CATEGORY`, `IS_ACTIVE` ) VALUES (NULL,'$M_CODE','$M_NAME','$M_SHORTNAME','$M_PARENTCODE','$M_ABSTRACT','$M_CATEGORY','$IS_ACTIVE')";
			if($mysqli->query($sql) == TRUE){
				
			} else {
				echo $mysqli->error;
			}
		}
	?>
	<form method="POST" action="">
	      CODE: <input type="text" name="M_CODE"><br>
	      NAME: <input type="text" name="M_NAME"><br>
		  SHORT NAME: <input type="text" name="M_SHORTNAME"><br>
		  PARENT CODE: <input type="text" name="M_PARENTCODE"><br>
		  IS ABSTRACT: <input type="text" name="M_ABSTRACT"><br>
		  CATEGORY: <input type="text" name="M_CATEGORY"><br>
		  ACTIVE: <input type="text" name="IS_ACTIVE"><br>
	     <br>
	     <input type="submit" name="submit" value="Ekle">
	</form>
	<br><a href='add_product.php'>Kayıtları listele</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
   </body>
</html>