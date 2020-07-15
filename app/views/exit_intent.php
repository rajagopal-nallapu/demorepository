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
</head>
<body>
<div class="signup-form text-center" style="width: 600px;">
    <form action="/examples/actions/confirmation.php" method="post" id="billing-info-form">
        <span class="glyphicon glyphicon-alert" style="font-size: 55px;color: #d3be0d;" aria-hidden="true"></span>
        <h2 class="text-center" style="font-size: 60px;">WAIT!</h2>
		<h2 class="text-center">Still Trying To Decide If CRC Will Work For You?</h2>
        <hr> 
        <p style="font-size: 22px;color: #555;font-weight: 600;">Watch our webinar where you'll learn the secrets to easily creating a profitable credit repair business Without having any prior experience with credit repair</p>
        <br/>
        <br/>
		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg">Watch Free Online Trainging NOW</button> 
        </div>
    </form>
</div>
</body>
</html>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>
   $.validate({
    form : '#billing-info-form',
    borderColorOnError : '#d72315',
    addValidClassOnAll : true
  });

  $('.edit-shipping-link').on('click', () => {
    $('#shipping-address').hide('slow');
    $('#shipping-address-form').show('slow');
  })
</script>