<?php

class UserBasicInfo
{
     /**
     * Positive test Data of user basic information where all parameters are not empty and valid
     * Use this data for validating assert condition to check all parameters are not empty
     * Use this data for validating assert condition to check all parameters are valid
     * 
     * @return array
     */
    public function userBasicInfoWithPositiveTestData()
    {
        $datasetOne = [
            [
                "firstName" =>  "    test",
                "lastName"  =>  "    sample",
                "email"     =>  "    tsample@gmail.com",
                "password"  =>  "  cam56Aw"
            ]
        ];
        $datasetTwo = [
            
            [
                "firstName"   =>  "test   ",
                "lastName"    =>  "sample   ",
                "email"       =>  "tsample1@gmail.com   ",
                "password"    =>  "   cam516Aw"
            ]
        ];
        $datasetThree = [
            [
                "firstName"   =>  "test   ",
                "lastName"    =>  "Samplee   ",
                "email"       =>  "tsample2@gmail.com   ",
                "password"    =>  "Cgaju$7   "
            ]
        ];
        $datasetFour = [
            [
                "firstName"   =>  "    test   ",
                "lastName"    =>  "   sample  ",
                "email"       =>  "  tsample3@gmail.com   ",
                "password"    =>  "   1234567   "
            ]
        ];
        $datasetFive = [
            [
                "firstName" =>  "     test ",
                "lastName"  =>  "     sample ",
                "email"     =>  "     tsample4@gmail.com ",
                "password"  =>  "   Cgaju&7 "
            ]
        ];
        
        return
        [
            'postive test data  set one'    => $datasetOne,
            'postive test data  set two'    => $datasetTwo,
            'postive test data  set three'  => $datasetThree,
            'postive test data  set four'   => $datasetFour,
            'postive test data  set five'   => $datasetFive
       ];
    }
 
     /**
     * Negative test Data of user basic information where some parameters are not empty and some are in valid
     * Use this data for validating assert condition to check where one parameter are not empty or valid
     * 
     * @return array
     */ 
    public function userBasicInfoWithNegativeTestData()
    {
        $datasetOne = [
            [
                "firstName" => "",
                "lastName"  => "   sample", 
                "email"     => "  tsample6@gmail.com",
                "password"  => "  cam56Aw"
            ]
        ];
        $datasetTwo = [
            [
                "firstName" => "test1   ", 
                "lastName"  => "", 
                "email"     => "tsample7@gmail.com  ",
                "password"  => "cam516Aw  "
            ]
        ];
        $datasetThree = [
            [
                "firstName" => "  test2  ",
                "lastName"  => "   sample2  ",
                "email"     => "",
                "password"  => "  Cgaju$7  "
            ]
        ];
        $datasetFour = [
            [
                "FirstName" => " test3",
                "LastName"  => "sample3",
                "Email"     => "tsample8@gmail.com",
                "password"  => ""
            ]
        ];
        return
        [
            'negative test data firstName is empty set one'         => $datasetOne,
            'negative test data lastName is empty set two'          => $datasetTwo,
            'negaive test data email is empty set three'            => $datasetThree,
            'negative test data email is duplicate set four'        => $datasetFour
       ];
    }
 
 
    /**
     * User basic information with all the parameters are empty
     * Use this data for validating assert condition to check all parameters are  empty
     * 
     * @return array
     */
    public function userBasicInfoWithAllParametersAreEmpty()
    {
        return [
            [[
                "FirstName" => "",
                "LastName"  => "", 
                "Email"     => "",
                "Password"  => "",
            ]]
        ];
    }

    public function dataProviderWithValidEmails()
    {
        return [
            'positve test data one'   => ["_test_sample_H@gmail.com"],
            'positve test data two'   => ["_test-967.sample@hotmail.co.in"],
            'positve test data three' => ["_TEST-SAMPLE_44@OUTLOOK.COM"],
            'positve test data four'  => ["testSamples1._test@hij.com"],
            'positve test data five'  => ["TeST-62.sample.sample@g-maili.com"],
            'positve test data six'   => ["TestSample4-0i2-iu@mail.org"],
            'positve test data seven' => ["sample_test.E@h-mail.co.in"],
            'positve test data eight' => ["Sample_test23.example@yop-mail.com"],
            'positve test data nine'  => ["testsample66-960--n@pmail.org"],
            'positve test data ten'   => ["Test1_Sample3-98_test@yahoo.org"]
        ];
    }

    public function dataProviderWithInvalidEmails()
    {
        return [
            'negative test data one'   => ["TestSample_a@@.com"],
            'negative test data two'   => ["testingsample h@.yahhoo.com"],
            'negative test data three' => [".testingsample66@hotmail.com"],
            'negative test data four'  => ["testingsample..@mail.org"],
            'negative test data five'  => [".sampletesting-998.jn@.co.in"],
            'negative test data six'   => ["sampleTEST_example..-@yp_mail.com"],
            'negative test data seven' => ["SampleTest67_02ih@yopmail.com1233@"],
            'negative test data eight' => ["sampletest7.2test@..org"],
            'negative test data nine'  => ["sampletest55..606tst@hotmail.org"],
            'negative test data ten'   => ["Sample.442test@_pmail.org"]
        ];
    }

    public function dataProviderWithValidPassword()
    {
    return
        [
        'positive test data one'   =>  ["@#$%1Hjo"],
        'positive test data two'   =>  ["j%42@#Hy"],
        'positive test data three' =>  ["Hy6)(#%@"],
        'positive test data four'  =>  ["gTy@6i$3"],
        'positive test data five'  =>  ["Ut9j8@#%"]
        ];
    }

}