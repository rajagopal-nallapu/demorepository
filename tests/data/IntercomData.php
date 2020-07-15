<?php

class IntercomData
{

    /**
     * Positive Test Data where parameters are not empty and valid
     * Use test Data in validating whether all parameters are valid
     * Use Test Data to check all parameters are not empty
     * 
     * @return Array 
     */
    public function positiveTestDataOfIntercomcompanies()
    {
        return
        [
            'positive Test Data set one' => [
                  
                    'remote_created_at' => time(),
                    'company_id' => "232",
                    'name' => "Demo CRO",
                    "plan" => 'Start',
                    "custom_attributes" => [
                        "phone" => "9490338142",
                        'Account Status' => 'Active',
                        'Account Type' => 'Trial',
                        'Mandrill Active' => 'No',
                        'Mailchimp Active' => 'No',
                        "Chargebee Active" => 'No',
                        'Number Of Leads' => 0,
                        'Number Of Active Clients' => 0,
                        'Number Of Affiliates' => 0,
                        'Number Of Team Members' => 0,
                        'Batch Print' => 'off',      
                        'CC Information Added' => 'No',
                        'Signup Flow' => 1
                    ]
                  
                ], 'positive Test Data set two' => [
                  
                    'remote_created_at' => time(),
                    'company_id' => "235",
                    'name' => "Demo CRO Test Data",
                    "plan" => 'Start',
                    "custom_attributes" => [
                        "phone" => "999-999-9999",
                        'Account Status' => 'Active',
                        'Account Type' => 'Trial',
                        'Mandrill Active' => 'Yes',
                        'Mailchimp Active' => 'Yes',
                        "Chargebee Active" => 'Yes',
                        'Number Of Leads' => 5,
                        'Number Of Active Clients' => 5,
                        'Number Of Affiliates' => 2,
                        'Number Of Team Members' => 7,
                        'Batch Print' => 'on',      
                        'CC Information Added' => 'Yes',
                        'Signup Flow' => 0
                    ]
                  
                ] ];
    }

     /**
     * Positive Test Data where parameters are not empty and valid
     * Use test Data in validating whether all parameters are valid
     * Use Test Data to check all parameters are not empty
     * 
     * @return Array 
     */

    public function positiveTestDataOfIntercomUsers()
    {
        return
        [
            'positive Test Data set one' => [
                'user_id'   => "1234",
                'email'     => "demo@demo.com",
                'id'        => "1234",
                'signed_up_at' => time(),
                'name'         => "John Doe",
                'companies'    => [
                    [
                        'id' => "666666"
                    ]
                ],
                'custom_attributes'  => [
                    'Account Status' => 'Active',
                    'Role'           => 'Account Holder'
                ]
            ], 'positive Test Data set two' => [
                'user_id'   => "123456",
                'email'     => "abcd@yopmail.com",
                'id'        => "123456",
                'signed_up_at' => time(),
                'name'         => "Johnson",
                'companies'    => [
                    [
                        'id' => "789458"
                    ]
                ],
                'custom_attributes'  => [
                    'Account Status' => 'Active',
                    'Role'           => 'Account Holder'
                ]
            ] ];
    }

     /**
     * Positive Test Data where parameters are not empty and valid
     * Use test Data in validating whether all parameters are valid
     * Use Test Data to check all parameters are not empty
     * 
     * @return Array 
     */

    public function positiveTestDataOfIntercomTags()
    {
        return
        [
            'positive Test Data set one' => [
                'name'  => 'Account Holder',
                'users' => [
                    [
                        'user_id' => "1234"
                    ]
                ]
            ], 'positive Test Data set two' => [
                'name'  => 'Account Holder',
                'users' => [
                    [
                        'user_id' => "56756"
                    ]
                ]
            ] ];
    }
        
}
