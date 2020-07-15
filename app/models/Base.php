<?php

namespace CRCSignup\Model;
use CRCSignup\Libraries\Database;

/**
 * CRC Signup Module - Base model
 */
class Base
{
    private $db;

    public function __construct()
    {
        $this->db = new Database(getenv('DEFAULT_DATABASE'));
    }

    public function getTimezoneOffset(string $timezone)
    {
        $this->db->query("SELECT vtimezone_abbr FROM cro_timezone WHERE vtimezone_name = :timezone");
        $this->db->bind(":timezone", $timezone);

        return $this->db->single();
    }

    public function getCountryDetails(int $countryId)
    {
        $this->db->query("SELECT country_code, currency_code, currency_symbol FROM cro_countries WHERE icountry_id = :country_id");
        $this->db->bind(":country_id", $countryId);

        return $this->db->single();
    }
}