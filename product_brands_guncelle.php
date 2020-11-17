<?php
include_once 'connection.php';
    $message   =  '';
	$barcode="";
	$syscode="";
		if(isset($_GET['barcode']) & isset($_GET['syscode'])){
			$barcode=$_GET['barcode'];
			$syscode=$_GET['syscode'];
			if(isset($_POST['submit']) & isset($_POST['tip']) & isset($_POST['abstract']) &isset($_POST['orgcity'])){
				$BARCODE  = $_POST['barcode'];
				$BRANDNAME =$_POST['brandname'];
				$MANUFACTURERNAME = $_POST['manufacturer'];
				$MSYSCODE = $_POST['msyscode'];
				$guncelleSorgusu = mysqli_query($mysqli,"UPDATE `product_brands` SET `BRAND_NAME`='$BRANDNAME',`MANUFACTURER_ID`='$MANUFACTURERNAME' WHERE BRAND_BARCODE='$barcode' and M_SYSCODE='$syscode'");
				if($guncelleSorgusu){
					echo "Kayıt güncellendi. 
					<a href='product_brands_listele.php'>Geri dön</a><br><br>";
				}
			}
		}
		$A= mysqli_query($mysqli,"SELECT * FROM product_brands,manufacturers WHERE product_brands.MANUFACTURER_ID=manufacturers.MANUFACTURER_ID and BRAND_BARCODE='$barcode' and M_SYSCODE='$syscode'");
		$kayit=mysqli_fetch_array($A);
		$B=mysqli_query($mysqli,"SELECT M_SYSCODE, M_NAME FROM `product` WHERE M_ABSTRACT=0");
		$kayit2=mysqli_fetch_array($B);
		$C= mysqli_query($mysqli,"SELECT `MANUFACTURER_ID`,`MANUFACTURER_NAME` FROM `manufacturers`");
		$kayit3=mysqli_fetch_array($C);
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select</title>


</head>
<body>
  
    <div class="container-fluid h-100 bg-light text-dark">
        <div class="row justify-content-center align-items-center">
            <h1>PRODUCT BRANDS GUNCELLE</h1>    
        </div>
        <hr/>
        <div class="row justify-content-center align-items-center h-100">
            <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3">
                <h5 class="text-success text-center" id="message"><?= $message; ?><h5>
                <form action="product_brands_guncelle.php" method="POST">
				 <div class="form-group">
					BRAND BARCODE: <input type="text" name="barcode" value="<?php echo $kayit['BRAND_BARCODE']; ?>" /><br />><br>
					BRANDNAME: <input type="text" name="brandname" value="<?php echo $kayit['BRAND_NAME']; ?>" /><br />><br>

                </div>
				<div class="form-group">
                    <select class="form-control" name="manufacturer">
						<option>Manufacturer Sec</option>
                        <?php foreach($C as $key => $value){ ?>
							<option value="<?= $value['MANUFACTURER_ID'];?>"><?= $value['MANUFACTURER_NAME']; ?></option>
                        <?php } ?>
                    </select>
                </div>
				<div class="form-group">
                    <select class="form-control" name="msyscode">
						<option>Product Sec</option>
                        <?php foreach($B as $key => $value){ ?>
							<option value="<?= $value['M_SYSCODE'];?>"><?= $value['M_NAME']; ?></option>
                        <?php } ?>
                    </select>
                </div>
				
              <div class="form-group">
                <div class="container">
                  <div class="row">
                    <div class="col"><button type="submit" name="submit" class="col-6 btn btn-primary btn-sm float-left">Submit</button></div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>

      <script>
        $(document).ready(function()
        {
            setTimeout(function()
            {
                $('#message').hide();
            },3000);
        });
    </script>
	<br><a href='manufacturer_interface.php'>Calisanlari goruntule</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>

</html>