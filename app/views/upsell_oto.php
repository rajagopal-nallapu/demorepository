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
<div class="signup-form" style="width: 600px;">
    <form action="<?php echo BASE_URL; ?>/base/purchaseCreditHeroChallenge" method="post">
        <input type="hidden" name="recurly_account_code" value="<?php echo $data['recurly_account_code']; ?>">
        <input type="hidden" name="company_id" value="<?php echo $data['company_id']; ?>">
        <h2 class="text-center alert">WAIT! Before You Start...</h2>
		<h2 class="text-center">How Would You Like Us To Hold You By The Hand, As You Launch Your Very Own Credit Repair Business?</h2>
        <hr>
        <div class="credit-hero-challenge text-center shadow rounded">
            <h2 class="title">Join The Credit Hero Challenge</h2>
            <p class="discount">HUGE 97% DISCOUNT!</p>
            <p class="amount">JUST $47 TODAY!</p>
            <p class="shipping">+ Shipping ($19.95)</p>
        </div>
        <div id="shipping-address">
            <h4 class="shipping-address-heading">Confirm Shipping Address:</h4>
            <div class="shipping-address">
                <p>Your Name</p>
                <p>123 Happy Lane,</p>
                <p style="float: left;">Los Angeles, CA 90025</p> <a href="javascript:void(0)" class="edit-shipping-link">Edit</a>
            </div>
        </div>
        <div style="display: none;" id="shipping-address-form">
            <div class="form-group">
                <input type="text" class="form-control" name="fullAddress" placeholder="Full Address..." data-validation="required">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="cityName" placeholder="City Name..." data-validation="required">
            </div>
            <div class="row">
                
                <div class="form-group col-lg-7">
                    <input type="text" class="form-control" name="email" placeholder="State/Province..." data-validation="required">
                </div>
                <div class="form-group col-lg-5">
                    <input type="text" class="form-control" name="zipcode" placeholder="Zip Code..." data-validation="required">
                </div>
                
            </div>
        </div>
        
        <br/>
        <br/>
		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg">Yes! Join The Credit Hero Challenge!</button> 
        </div>
        <div class="form-group text-center no-thanks">
            <a href="<?php echo BASE_URL; ?>/base/thank_you">No Thanks, I don't want to join the Credit Hero Challenge at a huge discount!</a>
        </div>
    </form>
</div>
</body>
</html>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>

  $('.edit-shipping-link').on('click', () => {
    $('#shipping-address').hide('slow');
    $('#shipping-address-form').show('slow');
  })
</script>