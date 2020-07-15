<?php

namespace CRCSignup\Controller;

use CRCSignup\Libraries\CurlServices;

/**
 * CRC Signup module - Partnestack Controller
 * Handles end to end communication with Partnestack (Growsumo)
 */
class Partnestack extends CurlServices
{
	/** Property to store Intercom API URL */
    private $endPoint;

	/** Property to store Intercom Token */
    private $authentication;

    /**
     * Constructor 
	 * Assigning the value when instance of class is created
     */
    public function __construct()
    {
        $this->authentication = getenv('PARTNERSTACK_AUTHENTICATION');
    }
    
    /**
     * PartnerStack Customer verfication
	 * 
     * @param string $customerEmail is the mail id of customer
     * 
     * @return array response of PartnerStack API call
     */
    public function checkPartnerStackCustomer(string $customerEmail)
    {
        $this->endPoint = getenv('PARTNERSTACK_API');
        $this->endPoint .= '/'.$customerEmail;
        $response = $this->executeCurl($this->endPoint,[],'','',$this->authentication);
        return $response;
    }

     /**
     * PartnerStack Customer details to create or update
	 * 
     * @param array  $data of customer
     * 
     * @return array response of PartnerStack API call
     */
    public function updatePartnerStackCustomer(arrry $data)
    {
        $this->endPoint = getenv('PARTNERSTACK_API');
        $updateReferredData = [
            'key'        => $data['customer_key'],
            'ip_address' => $data['ip_address'],
            'name'       => $data['full_name']
        ];
        if (isset($data['customer_referred'])) {
            $updateReferredData += [
                'partner_key' => $data['customer_referred'],
                'email' => $data['email']
            ];
        } else {
            $this->endPoint .= '/'.$data['email'];
        }

        if(!empty($updateReferredData)){
            $response = $this->executeCurl($this->endPoint,$updateReferredData,[],'PATCH',$this->authentication);
            return $response;
        }
    }   
}