<?php

namespace CRCSignup\Controller;
use CRCSignup\Controller\RecurlyFactory;

/**
 * CRC Signup module - Upsell Controller
 * Handles upsell purchase requests
 */
class Upsell
{
    Protected $data = [];    
    public function __construct(array $data) {
        $this->data = $data;
       // $this->purchase();
    }
    public function purchase()
    {
        $response = RecurlyFactory::charge($this->data);
        return $response;
    }
    public function recordPurchase()
    {
        //TODO: implement For inserting data into the database.
    }
    /**
      *  Valiation conditions to check RecurlyAccountCode, productDescription and amount
      */
    public function validateUpsellpurchaseData(){
        if(empty($this->data['productDescription'])) return false;
        if(empty($this->data['recurlyAccountCode'])) return false;
        if(empty($this->data['amount'])) return false;
        return false; 
    }
}