<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
  <title>Registration system PHP and MySQL</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
  <div class="header">
  	<h2>Register</h2>
  </div>
	
  <form method="post" action="register.php">
  	<?php include('errors.php'); ?>
	<div class="input-group">
  	  <label>Name</label>
  	  <input type="text" name="name">
  	</div>
	<div class="input-group">
  	  <label>Surname</label>
  	  <input type="text" name="surname">
  	</div>
	<div class="input-group">
  	  <label>E-mail</label>
  	  <input type="text" name="email">
  	</div>
	<div class="input-group">
  	  <label>Phone</label>
  	  <input type="text" name="tel">
  	</div>
	<div class="input-group">
  	  <label>Fax</label>
  	  <input type="text" name="fax">
  	</div>
	<div class="input-group">
  	  <label>Address</label>
  	  <input type="text" name="address">
  	</div>
  	<div class="input-group">
  	  <label>Password</label>
  	  <input type="password" name="password_1">
  	</div>
  	<div class="input-group">
  	  <label>Confirm password</label>
  	  <input type="password" name="password_2">
  	</div>
	<div class="input-group">
  	  <label>Organisation Name</label>
  	  <input type="text" name="org_name">
  	</div>
	<div class="input-group">
  	  <label>Username</label>
  	  <input type="text" name="username">
  	</div>
  	<div class="input-group">
  	  <button type="submit" class="btn" name="reg_user">Register</button>
  	</div>
  	<p>
  		Already a member? <a href="login.php">Sign in</a>
  	</p>
  </form>
</body>
</html>