<?php

class CreditHeroChallengeZapierData
{
     /**
     * Positive test Data  where all parameters are not empty and valid
     * Use this data for validating assert condition to check all parameters are not empty
     * Use this data for validating assert condition to check all parameters are valid
     * 
     * @return array
     */
    public function zapierWithPositiveTestData()
    {
        $datasetOne = [
          [
            "account_id"   => 123,
            "first_name"    =>  "Test Data",
            "last_name"     =>  "Sample",
            "email"        =>  "test11Data1Sample11@gmail.com",
            "full_address"  =>  "162 addressSample",
            "city"     =>  "Newyork",
            "state"        =>  "California",
            "zipcode"      =>  "96678"
          ]
        ];
        $datasetTwo = [
          [
            "account_id"   => 8932,
            "first_name"    =>  "Test Data",
            "last_name"     =>  "Sample",
            "email"        =>  "test22Data2Sample@yahoo.com",
            "full_address"  =>  "147 Addresstest",
            "city"     =>  "San Francisco",
            "state"        =>  "virginia",
            "zipcode"      =>  "83962"
          ]
        ];
        $datasetThree = [
          [
            "account_id"   => 5643,
            "first_name"    =>  "TestData",
            "last_name"     =>  "Sample",
            "email"        =>  "test33Data2@hotmail.co.in",
            "full_address"  =>  "629 address TestRoad",
            "city"     =>  "chicago",
            "state"        =>  "Indiana",
            "zipcode"      =>  "93749"
          ]
        ];
        $datasetFour = [
          [
            "account_id"   => 8934,
            "first_name"    =>  "testsample",
            "last_name"     =>  "data",
            "email"        =>  "testdata6sample6@hotmail.com",
            "full_address"  =>  "hyderabad",
            "state"        =>  "Telangana",
            "zipcode"      =>  "73892"
          ]
        ];
        $datasetFive = [
          [
            "account_id"   => 849,
            "first_name"    =>  "test sample",
            "last_name"     =>  "data",
            "email"        =>  "testdat7a@mailbox.org",
            "full_address"  =>  "283 street 9 testAddress",
            "city"     =>  "washington",
            "state"        =>  "Indiana",
            "zipcode"      =>  "78945"
          ]
        ];
        
        return
        [
          'postive test data set one'   => $datasetOne,
          'postive test data set two'   => $datasetTwo,
          'postive test data set three' => $datasetThree,
          'postive test data set four'  => $datasetFour,
          'postive test data set five'  => $datasetFive
        ];
    }
    
}