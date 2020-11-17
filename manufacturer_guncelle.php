<?php
include_once 'connection.php';
    $message   =  '';
	$id="";
	$selectCITY = "SELECT * FROM `country_city`";
    $result = mysqli_query ($mysqli, $selectCITY);
	$selectCOUNTRY = "SELECT * FROM country";
    $result2 = mysqli_query ($mysqli, $selectCOUNTRY);
		if(isset($_GET['id'])){
			$id=$_GET['id'];
			if(isset($_POST['submit'])){
				$M_NAME=$_POST['MANUFACTURER_NAME'];
				$M_ADDRESS=$_POST['MANUFACTURER_ADDRESS'];
				$guncelleSorgusu = mysqli_query($mysqli,"UPDATE `manufacturers` SET `MANUFACTURER_NAME`=[value-2],`MANUFACTURER_ADDRESS`=[value-3],`COUNTRY_CODE`=[value-4],`CITY_CODE`=[value-5] WHERE MANUFACTURER_ID='$id'");
				if($guncelleSorgusu){
					echo "Kayıt güncellendi. 
					<a href='add_product.php'>Geri dön</a><br><br>";
				}
			}
		}
		$A= mysqli_query($mysqli,"SELECT * FROM manufacturers,country,country_city WHERE manufacturers.COUNTRY_CODE=country.COUNTRY_CODE and country_city.Country_Code=country.COUNTRY_CODE and manufacturers.MANUFACTURER_ID='$id'");
		$kayit=mysqli_fetch_array($A);
    
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
            <h1>ADD A MANUFACTURE</h1>    
        </div>
        <hr/>
        <div class="row justify-content-center align-items-center h-100">
            <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3">
                <h5 class="text-success text-center" id="message"><?= $message; ?><h5>
                <form action="add_manufacture.php" method="POST">
				 <div class="form-group">
					NAME: <input type="text" name="MANUFACTURER_NAME" value="<?php echo $kayit['MANUFACTURER_NAME']; ?>" /><br />><br>
					ADDRESS: <input type="text" name="MANUFACTURER_ADDRESS" value="<?php echo $kayit['MANUFACTURER_ADDRESS']; ?>" /><br />><br>
                </div>
				<div class="form-group">
                    <select class="form-control" name="country">
                        <option disabled="disabled"><?php echo $kayit['COUNTRY_NAME']; ?></option>
                        <?php foreach($result2 as $key => $value2){ ?>
							<option value="<?= $value2['COUNTRY_CODE'];?>"><?= $value2['COUNTRY_NAME']; ?></option>
                        <?php } ?>
                    </select>
                </div>
				<div class="form-group">
                    <select class="form-control" name="city">
                        <option disabled="disabled"><?php echo $kayit['City_Name']; ?></option>
                        <?php foreach($result as $key => $value){ ?>
							<option value="<?= $value['CityID'];?>"><?= $value['City_Name']; ?></option>
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