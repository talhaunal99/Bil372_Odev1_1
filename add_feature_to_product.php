<?php
include_once 'connection.php';
    $selectPRODUCT = "SELECT * FROM `product` WHERE M_ABSTRACT=0";
    $result = mysqli_query ($mysqli, $selectPRODUCT);
	$selectFEATURE = "SELECT `FEATURE_ID`, `FEATURE_NAME` FROM `features`";
    $result2 = mysqli_query ($mysqli, $selectFEATURE);
    $message   =  '';
    if(isset($_POST['submit']) & isset($_POST['product']) & isset($_POST['feature']))
    {
        $pname       =   $_POST['product'];
        $fname  =   $_POST['feature'];
		$minval = $_POST['MINVAL'];
		$maxval = $_POST['MAXVAL'];
		
    
        // Attempt insert query execution
        $insert = "INSERT INTO `product_features`(`M_SYSCODE`, `FEATURE_ID`, `MINVAL`, `MAXVAL`) VALUES ('$pname','$fname','$minval','$maxval')";
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
            <h1>PRODUCT+FEATURE</h1>    
        </div>
        <hr/>
        <div class="row justify-content-center align-items-center h-100">
            <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3">
                <h5 class="text-success text-center" id="message"><?= $message; ?><h5>
                <form action="add_feature_to_product.php" method="POST">
				 <div class="form-group">
                    <input type="text" class="form-control" name="MINVAL" placeholder="MINIMUM VALUE">
					<input type="text" class="form-control" name="MAXVAL" placeholder="MAXIMUM VALUE">
                </div>
				<div class="form-group">
                    <select class="form-control" name="feature">
                        <option>SELECT FEATURE</option>
                        <?php foreach($result2 as $key => $value2){ ?>
							<option value="<?= $value2['FEATURE_ID'];?>"><?= $value2['FEATURE_NAME']; ?></option>
                        <?php } ?>
                    </select>
                </div>
				<div class="form-group">
                    <select class="form-control" name="product">
                        <option>SELECT PRODUCT</option>
                        <?php foreach($result as $key => $value){ ?>
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
	<br><a href='add_product.php'>Urunleri listele</a>
	<br><a href='feature_interface.php'>Ozellikleri listele</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>

</html>