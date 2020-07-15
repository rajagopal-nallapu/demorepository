<?php

namespace CRCSignup\Libraries;

class Mixpanel
{
    private $token;
    private $host;
    private $properties = [];

    public function __construct()
    {
        $this->token = getenv('MIXPANEL_TOKEN');
        $this->host = getenv('MIXPANEL_HOST');
    }

    public function setProperty($key, $value)
    {
        $this->properties[$key] = $value;
    }

    public function track(string $event, array $properties = [])
    {
        $params = [
            'event' => $event,
            'properties' => array_merge($this->properties, $properties)
        ];

        if (!isset($params['properties']['token'])){
            $params['properties']['token'] = $this->token;
        }

        $url = $this->host. 'track/?data='. base64_encode(json_encode($params));

       $this->_execute($url);
    }

    private function _execute(string $url)
    {
        $ch = curl_init($url);
		curl_setopt($ch, CURLOPT_URL, $url); 
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_exec($ch);		
    }
}