<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://js.recurly.com/v4/recurly.js"></script>
<link href="https://js.recurly.com/v4/recurly.css" rel="stylesheet" type="text/css">
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

<div class="container">
    <div class="row">
        <aside class="col-sm-6">

            <article class="card">
                <div class="card-body p-5">
                    <p> <img src="https://www.creditrepaircloud.com/hubfs/CRC-2020-Logo-Color-WEB-ONLY.svg" width="50%">
                    </p>

                    <form role="form" id="card-data-form" method="post" action="http://localhost/new_signup_flow/base/startSubscription">
                        <div class="form-group">
                            <label for="username">First Name</label>
                            <div class="input-group">
                                <input type="text" data-recurly="first_name" class="form-control" name="firstName" placeholder="" required="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="username">Last Name</label>
                            <div class="input-group">
                                <input type="text" data-recurly="last_name" class="form-control" name="lastName" placeholder="" required="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="username">Email</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="email" placeholder="" required="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="cardNumber">Card number</label>
                            <div class="input-group">
                                <div id="card-number"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-8">
                                <div class="form-group">
                                    <label><span class="hidden-xs">Expiration</span> </label>
                                    <div class="form-inline">
                                        <div id="card-expire-month"></div>
                                        <span style="width:10%; text-align: center"> / </span>
                                        <div id="card-expire-year"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV <i class="fa fa-question-circle"></i></label>
                                    <div id="card-cvv"></div>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="recurly-token" data-recurly="token">
                        <button class="subscribe btn btn-primary btn-block" type="submit"> Confirm </button>
                    </form>
                </div>
            </article>

        </aside>
    </div>
</div>
<script>
    const recurlyPublicKey = '<?php echo getenv('RECURLY_PUBLIC_KEY'); ?>';
</script>
<script type="text/javascript" src="../../new_signup_flow/public/js/src/recurly.js"></script>