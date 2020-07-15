<?php

namespace CRCSignup\Interfaces;

interface IFolder
{
    /**
     * Create a folder for the user in Uploads folder
     * To store the company related documents and attachments
     * 
     * @param string $registrationId The registration ID of the user
     */
    public function mount(int $registrationId);


    /**
     * To remove the folder from Uploads folder for the users
     * 
     * @param string $folderName The folder name to remove
     */
    public function unmount(string $folderName);


    /**
     * Create a file in the folder and add default data to the file
     * 
     * @param string $folderName The folder name
     * @param string $fileName The file name
     */
    public function createFile(string $fileName, string $folderName);
}