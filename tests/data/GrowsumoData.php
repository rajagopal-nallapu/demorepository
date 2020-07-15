<?php

class GrowsumoData
{

    /**
     * Positive Test Data where parameters are not empty and valid
     * Use test Data in validating whether all parameters are valid
     * Use Test Data to check all parameters are not empty
     * 
     * @return Array 
     */
    public function positiveTestDataOfGrowsumo()
    {
        return
        [
            'positive Test Data set one' => [
            'key'         => "abc2345",
            'ip_address'  => "123.123.123.123",
            'name'        => "John Doe",
            'partner_key' => "abcd1234",
            'email'       => "abc@yopmail.com"
        ],[
            'key'         => "abc22345",
            'ip_address'  => "123.123.123.123",
            'name'        => "John Doe2",
            'partner_key' => "abcd12234",
            'email'       => "abc2@yopmail.com"
        ]  ];
    }

 


        
}
