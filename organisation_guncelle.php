<?php
include_once 'connection.php';
    $message   =  '';
	$id="";
		if(isset($_GET['id'])){
			$id=$_GET['id'];
			if(isset($_POST['submit']) & isset($_POST['tip']) & isset($_POST['abstract']) &isset($_POST['orgcity'])){
				$NAME=$_POST['ORG_NAME'];
				$PARENT_ORG=$_POST['PARENT_ORG'];
				$ORG_DISTRICT=$_POST['ORG_DISTRICT'];
				$ORG_ADRESS=$_POST['ORG_ADDRESS'];
				$ABSTRACT= $_POST['abstract'];
				$TIP= $_POST['tip'];
				$CITY= $_POST['orgcity'];
				$guncelleSorgusu = mysqli_query($mysqli,"UPDATE `organisations` SET `ORG_NAME`='$NAME',`PARENT_ORG`='$PARENT_ORG',`ORG_ABSTRACT`='$ABSTRACT', `ORG_ADDRESS`='$ORG_ADDRESS', `ORG_CITY`='$CITY', `ORG_DISTRICT`='$ORG_DISTRICT', `ORG_TYPE`='$TIP' WHERE ORG_ID='$id'");
				if($guncelleSorgusu){
					echo "Kayıt güncellendi. 
					<a href='organisation_interface.php'>Geri dön</a><br><br>";
				}
			}
		}
		$A= mysqli_query($mysqli,"SELECT * FROM organisations,country_city WHERE organisations.ORG_ID=1 and organisations.ORG_CITY=country_city.CityID");
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
            <h1>ORGANİZASYON GUNCELLE</h1>    
        </div>
        <hr/>
        <div class="row justify-content-center align-items-center h-100">
            <div class="col col-sm-6 col-md-6 col-lg-4 col-xl-3">
                <h5 class="text-success text-center" id="message"><?= $message; ?><h5>
                <form action="organisation_interface.php" method="POST">
				 <div class="form-group">
					 Organizasyon adi: <input type="text" name="ORG_NAME" value="<?php echo $kayit['ORG_NAME']; ?>" /><br />><br>
					Parent organizasyon: <input type="text" name="PARENT_ORG" value="<?php echo $kayit['PARENT_ORG']; ?>" /><br />><br>
					Organizasyon Adresi: <input type="text" name="ORG_ADDRESS" value="<?php echo $kayit['ORG_ADDRESS']; ?>" /><br />><br>
					Organizasyon İlcesi: <input type="text" name="ORG_DISTRICT" value="<?php echo $kayit['ORG_DISTRICT']; ?>" /><br />><br>
                </div>
				<div class="form-group">
                    <select class="form-control" name="tip">
					<option>Organizasyon Tipi</option>
                        <option disabled="disabled"><?php echo $kayit['ORG_TYPE']; ?></option>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
                    </select>
                </div>
				<div class="form-group">
                    <select class="form-control" name="orgcity">
						<option>Sehir Sec</option>
                        <option disabled="disabled"><?php echo $kayit['City_Name']; ?></option>
                        <?php foreach($result as $key => $value){ ?>
							<option value="<?= $value['CityID'];?>"><?= $value['City_Name']; ?></option>
                        <?php } ?>
                    </select>
                </div>
				<div class="form-group">
                    <select class="form-control" name="abstract">
                        <option disabled="disabled"><?php echo $kayit['ORG_ABSTRACT']; ?></option>
                       <option value="0">0</option>
						<option value="1">1</option>
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