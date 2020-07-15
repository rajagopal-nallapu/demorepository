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
<link rel="stylesheet" href="../../new_signup_flow/public/css/src/style.css">
<script src="https://js.recurly.com/v4/recurly.js"></script>
<link href="https://js.recurly.com/v4/recurly.css" rel="stylesheet" type="text/css">
<script> 
    const baseUrl = '<?php echo BASE_URL; ?>';
</script>
</head>
<body>
<div class="signup-form">
    <form action="/examples/actions/confirmation.php" method="post" id="billing-info-form">
        <input type="hidden" data-recurly="first_name" value="<?php echo $data['firstName']; ?>">
        <input type="hidden" data-recurly="last_name" value="<?php echo $data['lastName']; ?>">
        <input type="hidden" name="logId" value="<?php echo $data['id']; ?>">
        <input type="hidden" name="recurly-token" data-recurly="token">
		<h2 class="text-center">Quick Billing Information</h2>
		<hr>
        <div class="form-group">
        	<input type="text" class="form-control" name="fullAddress" placeholder="Full Address..." data-validation="required">
        </div>
        <div class="form-group">
        	<input type="text" class="form-control" name="cityName" placeholder="City Name..." data-validation="required">
        </div>
        <div class="row">
            
            <div class="form-group col-lg-7">
        	    <input type="text" class="form-control" name="state" placeholder="State/Province..." data-validation="required">
            </div>
            <div class="form-group col-lg-5">
        	    <input type="text" class="form-control" name="zipcode" placeholder="Zip Code..." data-validation="required">
            </div>
            
        </div>
        <div id="recurly-elements">
            <!-- Recurly Elements will be attached here -->
        </div>
        <br/>
		<div class="form-check">
            <input type="checkbox" class="form-check-input checkbox-lg" id="business_essential_class" value="Yes">
            <label class="form-check-label bec-checkbox" for="business_essential_class">Yes, Add 50+ Marketing Ideas For Only $27!</label>
        </div>
        <br/>
        <div class="form-check">
            <input type="checkbox" class="form-check-input checkbox-terms" id="terms_and_conditions" value="Yes">
            <label class="form-check-label checkbox-label-terms" for="terms_and_conditions">30 days free from today, then just $179/m. Cancel under My Account or email (<a href="mailto:support@creditrepaircloud.com">support@creditrepaircloud.com</a>). I also agree to the <a href="#">terms of service</a> and <a href="#">privacy policy</a>.</label>
        </div>
        <br/>
		<div class="form-group">
            <button type="submit" class="btn btn-primary btn-block btn-lg submit-billing-info">Start My Free 30 Day Trial</button> 
        </div>
        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
            
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Modal Header</h4>
                </div>
                <div class="modal-body">
                    <div id="recurly-elements">
                        <!-- Recurly Elements will be attached here -->
                    </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
            
            </div>
        </div>
        
        </div>

    </form>
</div>
</body>
</html>
<script>
$(document).ready(function(){
  
    $("#myModal").modal();
 
});
</script>
<script>
    const recurlyPublicKey = '<?php echo getenv('RECURLY_PUBLIC_KEY'); ?>';
</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script type="text/javascript" src="<?php echo BASE_URL; ?>public/js/src/recurly.js"></script>
<script src="<?php echo BASE_URL; ?>public/js/src/main.js"></script>