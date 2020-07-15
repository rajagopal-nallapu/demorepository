<?php

namespace CRCSignup\Controller;

use CRCSignup\Libraries\Controller;
use CRCSignup\Interfaces\ISkeleton;

/**
 * CRC Signup module - Skeleton Controller
 * Handles the database creation for user from skeleton
 */
class Skeleton extends Controller implements ISkeleton
{
    /** Property to store user company registred id */
    private $registredId;
    
    /** Property to store user selected counrty id */
    private $countryId;

    /** Property to store destination database name  */
    private $destinationDatabase;

    /** Property to store source of database dump file path */
    private $sourceDatabase;

    /** Property to store reference of skeleton model */
    private $skeletonModel;

     /**
     * Constructor
     * Assigning the value when instance of class is created
     */
    public function __construct(string $registredId="400000",int $countryId=0)
    {
        $this->registredId   = $registredId;
        $this->countryId     = $countryId;
        $this->skeletonModel = $this->model('Skeleton');
    }

    /**
     * Getter to get country id
     * 
     * @return int $countryId to country id
     */
    public function getCountryId():int
    {
        return $this->countryId;
    }

    /**
     * Getter to get destination database name
     * 
     * @return int $destinationDatabase to get destination database name
     */
    public function getDestinationDatabaseName():string
    {
        return $this->destinationDatabase  = 'crcloud_'.$this->registredId.'_crd';
    }

    /**
     * Setter to set source database name
     * 
     * @param int $country to set source database base on counrty
     */
    public function setSourceDatabaseName(int $country)
    {
        $this->sourceDatabase = ROOT_PATH;

        switch ($country) {
            case 14:
                $this->sourceDatabase .= "\\skeleton_aus.sql";
            break;
            case 151:
                $this->sourceDatabase .= "\\skeleton_nz.sql";
            break;
            default :
                $this->sourceDatabase .= "\\crcloud_skeleton_crd.sql";
            break;
        }
    }

    /**
     * Getter to get source database name
     *
     * @return string $sourceDatabase to get source database name
     */
    public function getSourceDatabase():string
    {
        return $this->sourceDatabase;
    }

    /**
     * Read the source database to dump destination database name
     * 
     * @return bool if source database dump success
     * @throws Exception if source database dunp failed
     */
    public function readSqlStatements(string $fileName=NULL)
    {
        $this->setSourceDatabaseName($this->countryId);
        $source = $this->getSourceDatabase();
        $destination = $this->getDestinationDatabaseName();
        $dbCreated = $this->skeletonModel->createDatabase($destination);

        if ($dbCreated) {
            try {
                $sql = '';
                $queries = file($source);

                if ($queries) {
                    foreach ($queries as $query) {
                        if(substr($query, 0, 2) == '--' || $query == '')
                            continue;
                            $sql .= $query;
                        if(substr(trim($query), -1, 1) == ';') {
                            $this->execute($sql);
                            $sql = '';
                        }
                    }
                    return true;
                } else {
                    die("Error : Problem with reading the dump file. Please try again later");
                }
            } catch (\Exception $error) {
                die( 'Error : Problem with reading the dump file. Please try again later');
            }
        } else {
            die("Problem with creating new db") ;
        }
    }

    /**
     * Execute given query lines
     * 
     * @param string $lines is query to execute
     */
    public function execute(string $lines)
    {
        $this->skeletonModel->dumpTheData($lines);
    }

    /**
     * Default data to update given queries
     * 
     * @param string $queries is a set queries to execute
     * @return bool  if queries is exected 
     */
    public function updateDefaultData(array $queries=[])
    {
        $destinationDB = $this->getDestinationDatabaseName();
        $dbConnected   = $this->skeletonModel->useDatabase($destinationDB);

        if ($dbConnected && count($queries)>0) {
            foreach($queries as $query) {
                $this->skeletonModel->dumpTheData($query);
            }
            return true;
        } else {
            return true;
        }
    }
}