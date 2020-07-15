<?php

namespace CRCSignup\Controller;

use CRCSignup\Interfaces\IWebhook;
use Exception;

/**
 * CRC Signup module - Zapier Controller
 * Handles end to end zapier communication
 */
class Zapier implements IWebhook
{  

    protected string $url;
    protected array $data = [];
    
    public function __construct(string $url,array $data) {
        $this->url  = $url;
        $this->data = $data;
        $this->prepareData();
    }

    public function prepareData()
    {
        $this->data = json_encode($this->data);
    }

    public function makeRequest()
    {
		try {
			$ch = curl_init($this->url);
		
			curl_setopt($ch, CURLOPT_URL, $this->url);
			curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_TIMEOUT, 1000);
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS,$this->data);

			$response = curl_exec($ch);		
			return $response;
		} catch(Exception $e) {
			echo 'An unexpected error occurred. Please try again later';
		}    
		
    }

}