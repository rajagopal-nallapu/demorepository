<?php

namespace CRCSignup\Controller;

use CRCSignup\Interfaces\IFolder;

/**
 * CRC Signup module - Folder Controller
 * Handles the uploads folder functionality
 */
class Folder implements IFolder
{
    /** Property to store user company registred id */
    protected $RegistrationID;
    Protected $documentRoot;
    Protected $scriptName;
    /**
     * Constructor
     * Assigning the value when instance of class is created
     * Registration id will be passed to the constructor
     */
    public function __construct($RegistrationID)
    {
        $this->RegistrationID    = $RegistrationID;
        $this->documentRoot      = $_SERVER['DOCUMENT_ROOT'];
        $this->scriptName        = $_SERVER['SCRIPT_NAME'];
    }
    public function mount()
    {                 
        try {

           $error_flag = 0;
           if(!mkdir($this->documentRoot.str_replace("index.php",'',$this->scriptName)."uploads/".$this->RegistrationID.'_cmpny', 0777, true)){ $error_flag = 1; }
           if(!mkdir($this->documentRoot.str_replace("index.php",'',$this->scriptName)."uploads/".$this->RegistrationID.'_cmpny/logos', 0777, true) || $error_flag != 0){      $error_flag = 1; }
           if(!mkdir($this->documentRoot.str_replace("index.php",'',$this->scriptName)."uploads/".$this->RegistrationID.'_cmpny/contacts', 0777, true) || $error_flag != 0){   $error_flag = 1; }
           if(!mkdir($this->documentRoot.str_replace("index.php",'',$this->scriptName)."uploads/".$this->RegistrationID.'_cmpny/attachment', 0777, true) || $error_flag != 0){ $error_flag = 1; }
           if(!mkdir($this->documentRoot.str_replace("index.php",'',$this->scriptName)."uploads/".$this->RegistrationID.'_cmpny/documents', 0777, true) || $error_flag != 0){  $error_flag = 1; }

           $myFile     =  array();
           $myFile[]   =  $this->documentRoot.str_replace("index.php",'',$this->scriptName)."uploads/".$this->RegistrationID."_cmpny/index.php";
           $myFile[]   =  $this->documentRoot.str_replace("index.php",'',$this->scriptName)."uploads/".$this->RegistrationID."_cmpny/logos/index.php";
           $myFile[]   =  $this->documentRoot.str_replace("index.php",'',$this->scriptName)."uploads/".$this->RegistrationID."_cmpny/contacts/index.php";
           $myFile[]   =  $this->documentRoot.str_replace("index.php",'',$this->scriptName)."uploads/".$this->RegistrationID."_cmpny/attachment/index.php";
           $myFile[]   =  $this->documentRoot.str_replace("index.php",'',$this->scriptName)."uploads/".$this->RegistrationID."_cmpny/documents/index.php";
           $stringData = 'No direct access allowed';
           foreach($myFile as $filename){
            $fh = fopen($filename, 'w');
            fwrite($fh, $stringData);
            fclose($fh);              
           } 

           if($error_flag)
           return false;
           else 
           return true;
       } catch (\Exception $e) {
               echo static::EXCEPTION_MESSAGE; exit;
       }
    }

    public function unmount(string $folderName)
    {
        //TODO: implement
    }

    public function createFile(string $fileName, string $folderName)
    {
        $fh = @fopen($filename, 'w');
        @fwrite($fh, $stringData);
        @fclose($fh);
    }
}