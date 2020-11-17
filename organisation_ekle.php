<?php
include_once 'connection.php';
    $selectPRODUCT = "SELECT * FROM `country_city`";
    $result = mysqli_query ($mysqli, $selectPRODUCT);
    $message   =  '';
    if(isset($_POST['submit']) & isset($_POST['tip']) & isset($_POST['abstract']) &isset($_POST['orgcity']) )
    {
        $ORGNAME  = $_POST['organizasyon_adi'];
        $PARENTORG =$_POST['parent_org'];
		$ADDRESS = $_POST['org_address'];
		$İLCE = $_POST['org_district'];
		$ABSTRACT= $_POST['abstract'];
		$TIP= $_POST['tip'];
		$CITY= $_POST['orgcity'];
  
        // Attempt insert query execution
        $insert = "INSERT INTO organisations (ORG_NAME, PARENT_ORG, ORG_ABSTRACT, ORG_ADDRESS, ORG_CITY, ORG_DISTRICT, ORG_TYPE) 
                                                VALUES('$ORGNAME', '$PARENTORG', '$ABSTRACT', '$ADDRESS', '$CITY', '$İLCE', '$TIP')";
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
            <h1>ORGANISATION</h1>    
        </div>
        <hr/>
        <div class="row justify-content-center align-items-center h-100">
            <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3">
                <h5 class="text-success text-center" id="message"><?= $message; ?><h5>
                <form action="organisation_ekle.php" method="POST">
				 <div class="form-group">
                    Organizasyon adi: <input type="text" name="organizasyon_adi"><br>
					Parent organizasyon: <input type="text" name="parent_org"><br>
					Organizasyon Adresi: <input type="text" name="org_address"><br>
					Organizasyon İlcesi: <input type="text" name="org_district"><br>
                </div>
				<div class="form-group">
                    <select class="form-control" name="tip">
                        <option>Organizasyon Tipi</option>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
                    </select>
                </div>
				<div class="form-group">
                    <select class="form-control" name="abstract">
                        <option>Abstract</option>
							<option value="0">0</option>
							<option value="1">1</option>
                    </select>
                </div>
				<div class="form-group">
                    <select class="form-control" name="orgcity">
                        <option>Sehir Sec</option>
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
	<br><a href='organisation_interface.php'>Organizasyon listele</a>
	<br><a href='index.php'>Ana menüye geri dön</a>
</body>

</html>