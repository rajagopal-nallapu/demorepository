<?php

namespace CRCSignup\Interfaces;

interface IRackspace
{
    /**
     * To create the Rackspace Container folder to the users
     * {company_id}_cmpny_attachment
     * {company_id}_cmpny_documents
     * {company_id}_cmpny_misc
     * 
     * @param int $registrationId Registration Id of the user
     */
    public function createContainerFolders(int $registrationId);

    
    /**
     * to upload the objects to the created container
     * Moving default images to the container folder
     * 
     * @param string $object File name to copy
     * @param string $fromFolder The folder name from where onject is to be copied
     * @param string $toFolder The folder name to where the object to be copied
     */
    public function copyObject(string $object, string $fromFolder, string $toFolder);

}