<?php

namespace CRCSignup\Controller;

use CRCSignup\Libraries\Controller;
use CRCSignup\Controller\RecurlyFactory;
use CRCSignup\Libraries\Mixpanel;
use CRCSignup\Controller\Zapier;
/**
 * CRC Signup Module - Base Controller
 */
class Base extends Controller
{
    
    public function __construct() {
       $this->baseModel = $this->model('Base');
       $this->mp = new Mixpanel();
    }

    public function index()
    {
        $this->mp->track("Initial Page", array(
            "page" => "index"));   
        $this->view('index',['title' => 'Credit Repair Cloud']);
    }

    public function billing_info()
    {
        $this->view('billing_info',[
            'firstName' => $_GET['firstName'],
            'lastName'  => $_GET['lastName'],
            'id'        => $_GET['regId']
            ]);
    }

    public function upsell_oto()
    {
        $this->view('upsell_oto',[
            'recurly_account_code' => $_GET['rac_code'],
            'company_id'  => $_GET['c_id']
            ]);
    }

    public function thank_you()
    {
        $this->view('exit_intent',['title' => 'Credit Repair Cloud']);
    }

    public function purchaseCreditHeroChallenge()
    {
        $payload = [
            'accountCode' => $_POST['recurly_account_code'],
            'productDescription' => '14 Day Credit Hero Challenge',
            'amount' => 47
        ];

        $invoice = self::_collectAmount($payload);

        if($invoice->getObject() == 'invoice_collection') {
            $this->_zapierRequest();
        }

        header('Location: '.BASE_URL.'/base/thank_you');
    }

    private function _zapierRequest() { 

        $this->userModel = $this->model('User');
        $user = $this->userModel->getInfo($_POST['company_id']);

        $url = getenv('ZAPIER_CREDIT_HERO_CHALLENGE');

        $zapierRequestData = [
            'account_id' => $_POST['company_id'],
            'first_name' => $user[0]->vfirst_name,
            'last_name' => $user[0]->vlast_name,
            'email' => $user[0]->vemail,
            'full_address' => $user[0]->vcompany_addr1,
            'city' => $user[0]->vcompany_city,
            'state' => $user[0]->vcompany_state,
            'zipcode' => $user[0]->vpostcode
        ];

        $zapObject     = new Zapier($url,$zapierRequestData);
        $zapResponse   = $zapObject->makeRequest();
    }

    /**
     * To collect one time amount form the user
     * 
     * @param array $payload The array which contains payment information
     * 
     * Payload contains following data in array format
     * accountCode - The user's account code recived from Recurly
     * currency - Three digit currency code, if not provided it will be USD as default
     * amount - The amount to be charged Ex. 27 to collect $27
     * productDescription - Description of the product - like "Product: Business Essential Class"
     *  
     * @return array The recurly object
     */
    private static function _collectAmount(array $payload)
    {
        $response = RecurlyFactory::charge($payload);

       return $response;
    }
    
    
}