<?php

class AbandonedUserInfo
{

    /**
     * Positive Test Data where parameters are not empty and valid
     * Use test Data in validating whether all parameters are valid
     * Use Test Data to check all parameters are not empty
     * 
     * @return Array 
     */
    public function positiveTestDataOfZapTwo()
    {
        return
        [
            'positive Test Data set one' => [
                [
                        "firstName"   =>   "Test11Data1",
                        "lastName"    =>   "Sample11",
                        "email"       =>   "test11Data1Sample11@gmail.com"
            ]
        ],

            'positive Test Data set two' => [
                [
                        "firstName"    =>   "Test22Data2",
                        "lastName"     =>   "Sample22",
                        "email"        =>   "test22Data2Sample@yahoo.com"
                ]

            ],

            'positive Test Data set three' => [
                [
                        "firstName"   =>   "Test33Data3",
                        "lastName"    =>   "Sample3",
                        "email"       =>   "test33Data2@hotmail.co.in"
                ]
            ],

            'positive Test Data set four' => [
                [
                        "firstName"   =>   "testsample",
                        "lastName"    =>   "data6",
                        "email"       =>   "testdata6sample6@hotmail.com"
                ]
            ],

            'positive Test Data set five' => [
                [
                        "firstName"   => "test7sample",
                        "lastName"    =>  "data4",
                        "email"       =>  "testdat7a@mailbox.org",
                ]
            ]
        ];
    }


     /**
     * Negative Test Data where parameters are not valid
     * Use test Data in validating whether all parameters are valid
     * 
     * @return Array 
     */
    public function NegativeTestDataOfZapOne()
    {
        return
        [
            'Negative Test Data set one' => [
                [
                        "firstName"   =>   "Test11Data1^%",
                        "lastName"    =>   "Sample11&^",
                        "email"       =>   "TestSample_a@@.com"
            ]
        ],

            'Negative Test Data set two' => [
                [
                        "firstName"    =>   "Test22Data2#@%",
                        "lastName"     =>   "Sample22*&^@",
                        "email"        =>   "testingsample..@mail.org"
                ]

            ],

            'Negative Test Data set three' => [
                [
                        "firstName"   =>   "Test33Data3*&^",
                        "lastName"    =>   "Sample3&*(",
                        "email"       =>   "SampleTest67_02ih@@yopmail.com1233"
                ]
            ],

            'Negative Test Data set four' => [
                [
                        "firstName"   =>   "testsample#@%",
                        "lastName"    =>   "data6*(%",
                        "email"       =>   "Sample.442test@_pmail..org"
                ]
            ],

            'Negative Test Data set five' => [
                [
                        "firstName"   => "test7sample&^%",
                        "lastName"    =>  "data4(*^$",
                        "email"       =>  ".sampletesting-998.jn@.co.in",
                ]
            ]
        ];
    }
    /**
     * negative Test Data in the form of Associative Array
     * Use Test Data to validate  the condition where one parameter is empty
     */
        public function negativeTestDataofZapTwo()
        {
            return
            [
                'Negative Test Data set one' => [
                    [
                            "firstName"   =>   "TestSample1",
                            "lastName"    =>   "Data11",
                            "email"       =>   ""
                    ]
                ],

                'Negative Test Data set Two' => [
                    [
                           "firstName" =>  "TestSample2",
                           "lastName"  =>  "",
                           "email"     =>  "TestSample2@mailbox.org"
                    ]
                ],

                'Negative Test Data set Three' => [
                    [
                            "firstName"     =>   "",
                            "lastName"      =>   "SampleData3",
                            "email"         =>   "SampleData3@gmail.com"
                    ]
                ],
                'negative Test data set Four' => [
                    [
                            "firstName"    =>   "Sample4",
                            "lastName"     =>   "",
                            "email"        =>   ""
                    ]
                ],

                'negative Test data set Five' => [
                    [
                            "firstName"   =>   "",
                            "lastName"    =>   "Tsample1",
                            "email"       =>   ""
                    ]
                ],

                'negative Test data set Six' => [
                    [
                            "firstName"   =>   "",
                            "lastName"    =>   "",
                            "email"       =>   "TsampleData2@mailbox.org"
                    ]
                ],

            ];
        }
        



    /**
     * Negative Test Data where all parameters are empty
     * Use Test Data to validate the condition where all parameters are empty 
     */
        public function negativeTestDataofZapThree()
        {
            return
            [
               [
                    "firstName"  =>  "",
                    "lastName"   =>  "",
                    "email"      =>  ""
                ]
            ];
        }




 /**
 * Positive Test Data for FirstName and LastName validation
 * use this test data for  FirstName and LastName validating assert condition
 */
public function positiveTestDataForNameValidation()
{
  return
  [
    'positve test data one'   =>  "Test467",
    'positve test data two'   =>  "Sample1",
    'positve test data three' =>  "testsample4",
    'positve test data four'  =>  "Test66sample",
    'positve test data five'  =>  "testingSample7",
    'positve test data six'   =>  "TestSample",
    'positve test data seven' =>  "Sample2Testing",
    'positve test data eight' =>  "Sample3test",
    'positve test data nine'  =>  "testsample66",
    'positve test data ten'  =>   "Test1Sample398"
  ];

}




 /**
 * Negative Test Data for FirstName and LastName validation
 * use this test data for  FirstName and LastName not valid assert condition
 */
public function negativeTestDataForNameValidation()
{
  return
  [
  
  'negative test data one'   =>  "12345678945-6786%8",
  'negative test data two'   =>  "testing.Sample_!@#%",
  'negative test data three' =>  "!@#$%^&**",
  'negative test data four'  =>  "GT%&*976123829253256",
  'negative test data five'  =>  "^%(ERTYUIOSdfghgshkshiweyowhsjkbxl",
  'negative test data six'   =>  "dfghjklzxcvbnertyuixcvbertyu(^#",
  'negative test data seven' =>  "12345678@34*945678",

  ];

}



/**
 * Positive Test Data for email validation
 * use this test data for  email validating assert condition
 */
public function positiveTestDataForEmailValidation()
{
  return
  [
    'positve test data one'   =>  "_test_sample_H@gmail.com",
    'positve test data two'   =>  "_test-967.sample@hotmail.co.in",
    'positve test data three' =>  "_TEST-SAMPLE_44@OUTLOOK.COM",
    'positve test data four'  =>  "testSamples1._test@hij.com",
    'positve test data five'  =>  "TeST-62.sample.sample@g-maili.com",
    'positve test data six'   =>  "TestSample4-0i2-iu@mail.org",
    'positve test data seven' =>  "sample_test.E@h-mail.co.in",
    'positve test data eight' =>  "Sample_test23.example@yop-mail.com",
    'positve test data nine'  =>  "testsample66-960--n@pmail.org",
    'positve test data ten'   =>  "Test1_Sample3-98_test@yahoo.org"
  ];

}




/**
 * Negative Test Data for email validation
 * use this test data for  email not valid assert condition
 */
public function negativeTestDataForEmailValidation()
{
  return
  [
  'negative test data one'   =>  "TestSample_a@@.com",
  'negative test data two'   =>  "testingsample h@.yahhoo.com",
  'negative test data three' =>  ".testingsample66@hotmail.com",
  'negative test data four'  =>  "testingsample..@mail.org",
  'negative test data five'  =>  ".sampletesting-998.jn@.co.in",
  'negative test data six'   =>  "sampleTEST_example..-@yp_mail.com",
  'negative test data seven' =>  "SampleTest67_02ih@@yopmail.com1233",
  'negative test data eight' =>  "sampletest7.2test@..org",
  'negative test data nine'  =>  "sampletest55..606tst@hotmail.org",
  'negative test data ten'   =>  "Sample.442test@_pmail..org",
  ];

}



}
