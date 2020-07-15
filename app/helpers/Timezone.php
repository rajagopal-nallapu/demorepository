<?php

namespace CRCSignup\Helper;

use CRCSignup\Model\Base;

class Timezone
{
    const GEO_PLUGIN_URL = 'http://www.geoplugin.net/php.gp?ip=';
    const DEFAULT_TIMEZONE = 'America/Los_Angeles';

    public static function get(string $ipAddress = '')
    {
        if ($ipAddress == '' || !is_string($ipAddress)) {
            return static::DEFAULT_TIMEZONE;
        }

        $geoInfo = unserialize(file_get_contents(static::GEO_PLUGIN_URL.$ipAddress));
        $timezone = $geoInfo['geoplugin_timezone'];

        if($timezone == '' || $timezone == 'UTC') { 
            $timezone = static::DEFAULT_TIMEZONE; 
        }

        return $timezone;
    }

    public function getTimezoneOffset(Base $base, string $timezone = '')
    {
        $response = $base->getTimezoneOffset($timezone);
        return $response->vtimezone_abbr;
    }
}