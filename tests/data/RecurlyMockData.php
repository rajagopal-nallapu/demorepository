<?php

use PHPUnit\Framework\TestCase;

class RecurlyMockData
{
    
    /**
     * Positive test data to check whether the function working properly or not
     * 
     * @return array
     */
    public function recurlyMockInfoWithPositiveTestData()
    {
        return
        [
           'positive test data set one'  => [
              [
                "firstName"     =>  "testSample",
                "lastName"      =>  "sample1",
                "email"         =>  "testsampleSample1@gamil.com",
                "mobileNumber"  =>  "(021)-846937",
                "creditCard"    =>  "9273649374936483",
                "cvv"           =>  "234",
                "country"       =>  "US"
              ]
            ],
            'positive test data set two'  => [
              [
                "firstName"     =>  "testSample116",
                "lastName"      =>  "sample116",
                "email"         =>  "test_sample116@mailbox.co.in",
                "mobileNumber"  =>  "(826)-639374",
                "creditCard"    =>  "9173548263528368",
                "cvv"           =>  "923",
                "country"       =>  "Australia"
              ]
            ],
            'positive test data set three'  => [
              [
                "firstName"     =>  "Sampletest11",
                "lastName"      =>  "test1",
                "email"         =>  "sampletest11@gmail.com",
                "mobileNumber"  =>  "(02)92735283",
                "creditCard"    =>  "9172547829368263",
                "cvv"           =>  "823",
                "Country"       =>  "NewZealand"
              ]
            ]
        ];
    }

    public function accountCodeProvider()
    {
        return [
            'set one'   => ["lxu2khci1veou6oixvp61veou6o"],
            'set two'   => ["ko15zxo2dwby5h1veou6oixv6pj"],
            'set three' => ["ve5f01veou6oivb91k8m6wjqnoo"],
            'set four'  => ["vobopgtonr1veou6ojxvtcf1g41"],
            'set five'  => ["1veou6ou1thrahsfl9ucvbt6lt0"],
            'set six'   => ["p9zz378c281veou6oar8l2mu0xp"],
            'set seven' => ["zjhcv4j3szb9n501veou6oiol7x"]
        ];
    }
}