<?php

namespace CRCSignup\Controller;

use CRCSignup\Libraries\CurlServices;

/**
 * CRC Signup module - Intercom Controller
 * Handles end to end communication with Intercom
 */
class Intercom extends CurlServices
{
	/** Property to store Intercom API URL */
	private $endPoint;

	/** Property to store Intercom Token */
	private $token;

	/** Property to store Intercom Authentication Info */
	private $authentication;

	/**
     * Constructor 
	 * Assigning the value when instance of class is created
     */
	public function __construct()
    {
        $this->token = getenv('INTERCOM_TOKEN');
        $this->authentication = getenv('INTERCOM_AUTHENTICATION');
    }
	
	/**
     * Creates Intercom Request
	 * 
     * @param string $resourceName is type of customer model to update
     * @param array  $objectData is User information to update
     * 
     * @return array response of API Call
     */
    public function intercomRequest(string $resourceName, array $objectData)
	{
		$this->endPoint = getenv('INTERCOM_API');
		$this->endPoint .= $resourceName;
		$requestHeader = [
			"Authorization: Bearer $this->token",
			'Accept: application/json',
			'Content-Type:application/json',
			'Cache-Control: no-cache'
		];
		return  $this->executeCurl($this->endPoint,$objectData,$requestHeader,'POST',$this->authentication);
    }
}