<?php
include_once 'connection.php';
    $selectORG = "SELECT `ORG_ID`,`ORG_NAME` FROM `organisations` WHERE ORG_ABSTRACT=0";
    $result = mysqli_query ($mysqli, $selectORG);
	$selectPRODUCT= "SELECT `BRAND_BARCODE` FROM `product_brands`";
    $result2 = mysqli_query ($mysqli, $selectPRODUCT);
    $message   =  '';
    if(isset($_POST['submit']) & isset($_POST['barcode']) & isset($_POST['org']))
    {
        $LOT_ID  = $_POST['lotid'];
        $UNIT =$_POST['unit'];
		$IN = $_POST['in'];
		$OUT = $_POST['out'];
		$EXPIRY_DATE=$_POST['expirydate'];
		$ORG=$_POST['org'];
		$BARCODE=$_POST['barcode'];
		$BASEPRICE=$_POST['price'];
        // Attempt insert query execution
        $insert = "INSERT INTO `brand_orgs`(`LOT_ID`, `ORG_ID`, `BRAND_BARCODE`, `UNIT`, `EXPIRY_DATE`, `BASEPRICE`, `IN`, `OUT`) VALUES ('$LOT_ID','$ORG','$BARCODE','$UNIT','$EXPIRY_DATE','$BASEPRICE','$IN','$OUT')";
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
            <h1>BRAND ORGS</h1>    
        </div>
        <hr/>
        <div class="row justify-content-center align-items-center h-100">
            <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3">
                <h5 class="text-success text-center" id="message"><?= $message; ?><h5>
                <form action="brand_orgs_add.php" method="POST">
				 <div class="form-group">
                   LOT_ID: <input type="text" name="lotid"><br>
					UNIT: <input type="text" name="unit"><br>
					EXPIRY_DATE '('YYYY-MM-DD')': <input type="text" name="expirydate"><br>
					IN: <input type="text" name="in"><br>
					OUT: <input type="text" name="out"><br>
					BASE PRICE:: <input type="text" name="price"><br>
                </div>
				<div class="form-group">
                    <select class="form-control" name="barcode">
                        <option>BARCODE</option>
                        <?php foreach($result2 as $key => $value){ ?>
							<option value="<?= $value['BRAND_BARCODE'];?>"><?= $value['BRAND_BARCODE']; ?></option>
                        <?php } ?>
                    </select>
                </div>
				<div class="form-group">
                    <select class="form-control" name="org">
                        <option>ORGANISATION</option>
                        <?php foreach($result as $key => $value){ ?>
							<option value="<?= $value['ORG_ID'];?>"><?= $value['ORG_NAME']; ?></option>
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
	<br><a href='brand_orgs.php'>BRAND ORGANISATION listele</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>

</html>