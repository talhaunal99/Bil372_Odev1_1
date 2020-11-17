<?php
include_once 'connection.php';
    $selectCITY = "SELECT * FROM `country_city`";
    $result = mysqli_query ($mysqli, $selectCITY);
	$selectCOUNTRY = "SELECT * FROM country";
    $result2 = mysqli_query ($mysqli, $selectCOUNTRY);
    $message   =  '';
    if(isset($_POST['submit']) & isset($_POST['country']) & isset($_POST['city']))
    {
        $mname    = $_POST['MANUFACTURERNAME'];
        $madress  = $_POST['MANUFACTURERADRESS'];
		$cityname = $_POST['city'];
		$countryname = $_POST['country'];
		
    
        // Attempt insert query execution
        $insert = "INSERT INTO `manufacturers`(`MANUFACTURER_ID`, `MANUFACTURER_NAME`, `MANUFACTURER_ADDRESS`, `COUNTRY_CODE`, `CITY_CODE`) VALUES (NULL,'$mname','$madress','$countryname','$cityname')";
        if(mysqli_query($mysqli, $insert)){
            $message =  "Records added successfully.";
        } 
            else
        {
            $message = "ERROR: Could not able to execute $insert. " . mysqli_error($mysqli);
        }
        mysqli_close($mysqli);
    } 
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
                    <input type="text" class="form-control" name="MANUFACTURERNAME" placeholder="NAME">
					<input type="text" class="form-control" name="MANUFACTURERADRESS" placeholder="ADDRESS">
                </div>
				<div class="form-group">
                    <select class="form-control" name="country">
                        <option disabled="disabled">SELECT COUNTRY</option>
                        <?php foreach($result2 as $key => $value2){ ?>
							<option value="<?= $value2['COUNTRY_CODE'];?>"><?= $value2['COUNTRY_NAME']; ?></option>
                        <?php } ?>
                    </select>
                </div>
				<div class="form-group">
                    <select class="form-control" name="city">
                        <option disabled="disabled">SELECT CITY</option>
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