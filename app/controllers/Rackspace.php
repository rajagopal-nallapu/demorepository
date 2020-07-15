<?php

namespace CRCSignup\Controller;

use CRCSignup\Libraries\Controller;
use CRCSignup\Interfaces\IRackspace;
use OpenCloud\Rackspace as RackspaceClient;
use OpenCloud\ObjectStore\Constants\UrlType;

/**
 * CRC Signup module - Rackspace Controller
 * Handles communication with Rackspace containers
 **/

/**
 * List of function in class as below
 * authorize()      authorizeRegion()      setRegion()    getRegion()       setRegistredId()
 * getRegistredId()     getContainerSequence()       getContainerSuffix()       getContainerName()
 * createRackspaceContainer()      createContainerFolders()        copyObject() 
 **/

 /**
 * Error message codes referance cehck below
 * RS001 -- Authorize to rackspace is failed
 * RS002 -- Authorize region to rackspace is invalid
 * RS003 -- Creating container is failed
 * RS004 -- Copying to rackspace container is failed from uploadTarFileFromLocalPath
 * RC005 -- createContainerFolders is Failed, due to unknow problem, please try again.
 **/

class Rackspace extends Controller implements IRackspace
{
    /** Default exception message */
    public const EXCEPTION_MESSAGE = "We have encountered an unexpected problem. Please try again.";

    /** Default container suffix for attachment */
    private const ATTACHMENT_CONTAINER_SUFFIX = '_cmpny_attachment';

    /** Default container suffix for documents */
    private const DOCUMENTS_CONTAINER_SUFFIX = '_cmpny_documents';

    /** Default container suffix for misc */
    private const MISC_CONTAINER_SUFFIX = '_cmpny_misc';
    
    /** Default new container name sequence start */
    private const NEW_SEQUENCE_FOR_CONTAINER = 400000;

    /** Property to store client user name */
    public string $userName;

    /** Property to store client key */
    public string $key;

    /** Property to store region of host server */
    public string $region;

    /** Property to create instance of rackspace */
    public $client;
  
    /** Property to store user selected counrty id */
    public $countryId;

    /** Property to store user company registred id */
    public $registredId;
   
    /**
     * Constructor
     * Assigning the value when instance of class is created
     * SetRegion to set region of Rackspace host server
     * Authorize call to authorincate with Rackspace host
     */
    public function __construct($countryId=NULL)
    {
        $this->countryId    = $countryId;
        $this->userName     = getenv('RACKSPACE_USERNAME');
        $this->key          = getenv('RACKSPACE_API_KEY');

        $this->setRegion(getenv('RACKSPACE_DEFAULT_REGION'));
        $this->authorize();
    }

    /*
    public function __get($property)
    {
        if(!property_exists($this,$property)){
           throw new \Error("Message: Property {$property} Does Not Exist");
        }
        return $this->$property;
    }

    public function __set($property,$value)
    {
        $this->{$property} = $value;
    }*/


    /**
     * Authorize Rackspace using endpoint, user name, API key
     * Provides rackspace client object if authorized
     * 
     * @return Object Rackspace client object
     * @throws Exception If authorization failed
     */
    public function authorize()
    {
        try {
            // Instantiate a Rackspace client. 
           $this->client = new RackspaceClient(RackspaceClient::US_IDENTITY_ENDPOINT, array(
               'username' => $this->userName,
               'apiKey'   => $this->key,
           ));
           // SSL verify is set to true means enabled otherwise disabled
           $this->client->setDefaultOption('verify', false);
           return true;
       } catch(\Exception $error) {
            echo 'Message [RS001] : '.self::EXCEPTION_MESSAGE;
            return false;
        }  
    }

    /**
     * Provides rackspace client object region service
     * 
     * @return Object Rackspace client object service 
     * @throws Exception If authorize region failed
     */
    public function authorizeRegion()
    {
        try {
            // Obtain an Object Store service object from the client based on region.
            return $this->client->objectStoreService(NULL,$this->getRegion());
        } catch(\Exception $error) {
            echo 'Message [RS002] : '.self::EXCEPTION_MESSAGE;
        } 
    }

    /**
     * Setter to set region
     * 
     * @param string $region to set region
     */
    public function setRegion(string $region)
    {
        $this->region = $region;
    }

    /**
     * Getter to get region
     * 
     * @return string $region to get region
     */
    public function getRegion()
    {
        return $this->region;
    }

    /**
     * Setter to set registred id
     * 
     * @param int $registredId to set registred id
     */
    public function setRegistredId(int $registredId)
    {
        $this->registredId = $registredId;
    }

    /**
     * Getter to get registred id
     * 
     * @return int  to get registred id
     */
    public function getRegistredId():int
    {
        return $this->registredId;
    }

    /**
     * Getter to get new sequence for container name
     * 
     * @return int  to get new sequence for container name
     */
    public function getContainerSequence():int
    {
        return self::NEW_SEQUENCE_FOR_CONTAINER + (int)$this->getRegistredId();
    }

    /**
     * Getter to get suffix for container name
     * 
     * @param string $containerName is type of container
     * @return string to get suffix for container name
     */
    public static function getContainerSuffix(string $containerName):string 
    {
        switch($containerName) {
            case 'attachment' :
                return self::ATTACHMENT_CONTAINER_SUFFIX;
            break; 
            case 'documents' :
                return self::DOCUMENTS_CONTAINER_SUFFIX;
            break; 
            case 'misc' :
                return self::MISC_CONTAINER_SUFFIX;
            break;
        }
    }

    /**
     * Getter to get new container name
     * 
     * @param string $containerName is type of container
     * @return string to get new container name
     */
    public function getContainerName(string $containerName):string 
    {
       return 'test_container_by_anil_'.$this->getContainerSequence().self::getContainerSuffix($containerName);
    }

     /**
     * Create new container in rackspace
     * 
     * @param string $containerName is type of container
     * @return bool true if container creation is done
     * @throws Exception If container creation is failed
     */
    public function createRackspaceContainer(string $containerName)
    {
        $containerName    = $this->getContainerName($containerName);
        try {
            $this->authorizeRegion()->createContainer($containerName);
            return true;
        } catch (\Exception $error) {
            echo 'Message [RS003] : '.self::EXCEPTION_MESSAGE;
            return false;
        } 
    }

    /**
     * Upload file to newly created container
     * 
     * @return bool true if container creation is done
     * @throws Exception If container creation is failed
     */
    public function uploadTarFileFromLocalPath(string $containerName)
    {
        $fileData = NULL;
        $tarFileName = RACKSPACE_PATH.$containerName.".tar";
        
        if ($this->countryId==14 && $containerName=='misc') {
            $containerName .= $this->countryId;
            $tarFileName = RACKSPACE_PATH.$containerName.".tar";
        }

        if (file_exists($tarFileName)) {
            try {
                $fileData = fopen($tarFileName, 'r');
                $destinationContainerName = $this->getContainerName($containerName);
                $this->authorizeRegion()->bulkExtract($destinationContainerName, $fileData, UrlType::TAR);
                return true;
            } catch(\Exception $error) {
                echo 'Message [RS004] : '.self::EXCEPTION_MESSAGE;   
                return false;
            }  
        } else {
            echo 'Message: Copying files is failed due to tarFile not exists in given path.'; 
        }
    }

    /**
     * Create new conatiner and move files to rackspace
     * 
     * @param int $registredId to create container based on registred id in rackspace
     * @return bool true if rackspace container creation is done
     * @throws Exception If rackspace container creation is failed
     */
    public function createContainerFolders(int $registredId)
    {
        try {
            $this->setRegistredId($registredId);
            $this->createRackspaceContainer('attachment');
            $this->createRackspaceContainer('misc');
            $this->uploadTarFileFromLocalPath('misc');
            $this->createRackspaceContainer('documents');
            $this->uploadTarFileFromLocalPath('documents');
            return true;
        } catch (Exception $error) {
            echo 'Message [RC005] : '.self::EXCEPTION_MESSAGE;
            return false;
        }
    }

    public function copyObject(string $object, string $fromFolder, string $toFolder)
    {
        // Todo
    }
    

}