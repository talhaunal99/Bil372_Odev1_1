<?php
include_once 'connection.php';
    $selectM_SYSCODE = "SELECT M_SYSCODE,M_NAME FROM `product`";
    $result = mysqli_query ($mysqli, $selectM_SYSCODE);
	$selectMANUFACTURER = "SELECT `MANUFACTURER_ID`,`MANUFACTURER_NAME` FROM `manufacturers`";
    $result2 = mysqli_query ($mysqli, $selectMANUFACTURER);
    $message   =  '';
    if(isset($_POST['submit']) & isset($_POST['manucture']) & isset($_POST['msyscode']))
    {
        $BARCODE  = $_POST['barcode'];
        $BRANDNAME =$_POST['brandname'];
		$MANUFACTURERNAME = $_POST['manucture'];
		$MSYSCODE = $_POST['msyscode'];
		
        // Attempt insert query execution
        $insert = "INSERT INTO `product_brands`(`BRAND_BARCODE`, `M_SYSCODE`, `BRAND_NAME`, `MANUFACTURER_ID`) VALUES ('$BARCODE','$MSYSCODE','$BRANDNAME','$MANUFACTURERNAME')";
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
            <h1>PRODUCT BRANDS</h1>    
        </div>
        <hr/>
        <div class="row justify-content-center align-items-center h-100">
            <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3">
                <h5 class="text-success text-center" id="message"><?= $message; ?><h5>
                <form action="product_brands_ekle.php" method="POST">
				 <div class="form-group">
                    BRAND BARCODE: <input type="text" name="barcode"><br>
					BRAND NAME: <input type="text" name="brandname"><br>
                </div>
				<div class="form-group">
                    <select class="form-control" name="manucture">
                        <option>MANUFACTURER NAME</option>
                        <?php foreach($result2 as $key => $value){ ?>
							<option value="<?= $value['MANUFACTURER_ID'];?>"><?= $value['MANUFACTURER_NAME']; ?></option>
                        <?php } ?>
                    </select>
                </div>
				<div class="form-group">
                    <select class="form-control" name="msyscode">
                        <option>PRODUCT</option>
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
	<br><a href='product_brands_listele.php'>Product brands listele</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>

</html>