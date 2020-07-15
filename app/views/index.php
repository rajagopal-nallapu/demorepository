<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<title>Credit Repair Cloud</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="<?php echo BASE_URL; ?>public/css/src/style.css">
<link rel="stylesheet" href="<?php echo BASE_URL; ?>public/css/src/jquery.toast.css">
<script> 
    const baseUrl = '<?php echo BASE_URL; ?>';
</script>
</head>
<body>
<div class="signup-form">
    <form method="post" id="registration">
		<h2 class="text-center">Start Your 30 Day FREE Trial</h2>
		<p class="text-center">No contracts, downgrade or cancel your account anytime with a single click from your dashboard...</p>
		<hr>
        <div class="form-group">
        	<input type="text" class="form-control" name="firstName" placeholder="First Name" data-validation="required">
        </div>
        <div class="form-group">
        	<input type="text" class="form-control" name="lastName" placeholder="Last Name" data-validation="required">
        </div>
        <div class="form-group">
        	<input type="email" class="form-control email" name="email" placeholder="Enter Your Email Address" data-validation="email">
        </div>
        <div class="form-group">
            <div class="emailError"></div>
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password" data-validation="required">
        </div>
		<div class="form-group">
            <select class="form-control" name="country">
                <option value="224">United States</option>
                <option value="14">Australia</option>
                <option value="39">Canada</option>
                <option value="99">India</option>
                <option value="151">New Zealand</option>
                <option value="195">South Africa</option>
                <option value="223">United Kingdom</option>
            </select> 
        </div>
		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg">Create My Account Now!</button> 
        </div>
    </form>
</div>
</body>
</html>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script src="<?php echo BASE_URL; ?>public/js/src/jquery.toast.js"></script>
<script src="<?php echo BASE_URL; ?>public/js/src/main.js"></script>
