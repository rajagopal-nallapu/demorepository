<?php

namespace CRCSignup\Libraries;

use Exception;

/**
 * CurlServices to handle the most of API Calls
 * Handles communication with endPoint API Providers
 */

class CurlServices
{

	/**
     * Creates API Request to any Service provider most
	 * 
     * @param string $endPoint is API URL of Service provider
     * @param array  $data is information to update based of request
	 * @param array  $headerData is API request header information
	 * @param string $request is type of request of API Call
	 * @param string $authenticate is API user & password into one string username:password
     * 
     * @return array response of API Call
     */
	protected function executeCurl(string $endPoint='',array $data=[],array $headerData= [],string $request='',string $authenticate=''):array
	{
		$response =  [];

		$requestHeader = [
            'Accept: application/json',
            'Content-Type: application/json',
            'Cache-Control: no-cache'
		];
		
		$curlOptions = [
			CURLOPT_URL 			=>$endPoint,
			CURLOPT_RETURNTRANSFER 	=> true,
            CURLOPT_SSL_VERIFYHOST 	=> false,
            CURLOPT_SSL_VERIFYPEER 	=> false,
			CURLOPT_TIMEOUT 		=> 0
		];

		if ($request !=''){
			$curlOptions += [CURLOPT_CUSTOMREQUEST => $request];
		}

		if (!empty($data)) {
			$curlOptions += [CURLOPT_POSTFIELDS => json_encode($data)];
		}
		
		if (!empty($headerData)) {
			$requestHeader = $headerData;
		}
		$curlOptions += [CURLOPT_HTTPHEADER => $requestHeader];
	
		if ($authenticate!='') {
			$curlOptions += [
                CURLOPT_HTTPAUTH 	=> CURLAUTH_ANY,
                CURLOPT_USERPWD 	=> $authenticate
            ];
		}
		
		try {
			$curl = curl_init();
			curl_setopt_array($curl,$curlOptions);
			$response = [
				'response'		=> curl_exec($curl),
				'error'			=> curl_error($curl),
				'response_code' => curl_getinfo($curl,CURLINFO_HTTP_CODE)
			];
			curl_close($curl);
			return $response;
			
		} catch(\Exception $error) {
			echo 'An unexpected error occurred. Please try again later';
		}   
	}

}