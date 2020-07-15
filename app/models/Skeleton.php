<?php

namespace CRCSignup\Model;
use CRCSignup\Libraries\Database;

/**
 * CRC Signup Module - Skeleton model
 */
class Skeleton
{
    private $db;

    /**
     * Constructor
     * Sets the Database object
     */
    public function __construct()
    {
        $this->db = new Database();
    }

    public function createDatabase(string $databaseName)
    {
        try{
            $this->db->execQuery("CREATE DATABASE IF NOT EXISTS $databaseName; USE $databaseName;");
            return true; 
        }catch (\Exception $error){
            die( 'Database creation failed : ' . $error->getMessage() );
        }
    }

    public function useDatabase(string $databaseName)
    {
        try{
            $this->db->execQuery("USE $databaseName; ");
            return true; 
        }catch (\Exception $error){
            die( 'Database creation failed : ' . $error->getMessage() );
        }
    }

    public function dumpTheData(string $sql)
    {
        try{
            $this->db->execQuery($sql);
        }catch (\Exception $error){
            die( 'Database exection queries failed : ' . $error->getMessage() );
        }
    }
}
    
