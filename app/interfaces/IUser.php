<?php

namespace CRCSignup\Interfaces;

interface IUser
{


    /**
     * To check wheather user is already exist in the system
     * Checking user email id existed in half registed signup table and company registration table
     * 
     * @param string $email Email Address
     */
    public function checkAlreayExists(string $email);


    /**
     * Update the user signup status after every defined step
     * To continue the user from the last step in case of any failure
     * 
     * @param string $status The status of the user registration
     */
    public function updateRegistrationStatus(string $status);


    /**
     * To Register the user in company registration table
     * This is the main Registartion for the user to store all the information
     * 
     * @param array $data User information array
     * 
     * @return int The Registration ID of the user if success
     */
    public function makeEntryInCompanyRegistration(array $data);


    /**
     * Create an entry in User Access table for the user
     * This is for storing information related to login to the application
     * 
     * @param array $data
     */
    public function makeEntryInUserAccess(array $data);


    /**
     * Update important tables in child database with pre-defined/default data.
     */
    public function insertDefaultDataIntoTheChildTables();

    /**
     * Ceate sample client for the user
     */
    public function createSampleClient();

    /**
     * Create sample affiliate for the user
     */
    public function createSampleAffiliate();


    /**
     * Creating default tasks for the user
     */
    public function createDefaultTasks();
    
}