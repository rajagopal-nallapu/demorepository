<?php

class UserAccessinfo
{
     /**
     * Positive test Data where all parameters are not empty and valid
     * Use this data for validating assert condition to check all parameters are not empty
     * Use this data for validating assert condition to check all parameters are valid
     * 
     * @return array
     */
    public function UserAccessWithPositiveTestData()
    {
        $datasetOne = [
          [
            "reg_id"        =>  "43278589",
            "user_name"     =>  "sampleTest1",
            "password"      =>  "Sample@#23",
            "user_type"     =>   1,
            "first_Name"    =>  "sample24",
            "last_Name"     =>  "Test1",
            "email"         =>  "test11Data1Sample11@gmail.com",
            "countryCode"  =>  224,
            "db_name"       =>  "user_crd"
          ]
        ];
        $datasetTwo = [
          [
            "reg_id"        =>  "89954478857",
            "user_name"     =>  "sample2Test2",
            "password"      =>  "Teste@23",
            "user_type"     =>   3,
            "first_Name"    =>  "sample2",
            "last_Name"     =>  "Test2",
            "email"         =>  "test22Data2Sample@yahoo.com",
            "countryCode"  =>  224,
            "db_name"       =>  "user_crd"
          ]
        ];
        $datasetThree = [
          [
            "reg_id"        =>  "29549878589",
            "user_name"     =>  "sampleTest6",
            "password"      =>  "SeTest@#23",
            "user_type"     =>   2,
            "first_Name"    =>  "sample",
            "last_Name"     =>  "Test6",
            "email"         =>  "test33Data2@hotmail.co.in",
            "countryCode"  =>  224,
            "db_name"       =>  "userData_crd"
          ]
        ];
        $datasetFour = [
          [
            "reg_id"        =>  "43277658589",
            "user_name"     =>  "TestSample48",
            "password"      =>  "S@mple@#23",
            "user_type"     =>   2,
            "first_Name"    =>  "Test",
            "last_Name"     =>  "Sample48",
            "email"         =>  "testdata6sample6@hotmail.com",
            "countryCode"  =>  224,
            "db_name"       =>  "userdata_crd"
          ]
        ];
        $datasetFive = [
          [
            "reg_id"        =>  "78668589",
            "user_name"     =>  "sampleTest5",
            "password"      =>  "Sample@#23",
            "user_type"     =>   1,
            "first_Name"    =>  "sample",
            "last_Name"     =>  "Test5",
            "email"         =>  "testdat7a@mailbox.org",
            "countryCode"  =>  224,
            "db_name"       =>  "user_crd"
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
     
     /**
     * Negative test Data where all parameters are not empty and not valid
     * Use this data for validating assert condition to check where one parameter are not empty
     * 
     * @return array
     */ 
    public function userDataWithNegativeTestData()
    {
        $datasetOne = [
          [
            "reg_id"        =>  "4327858987465",
            "user_name"     =>  "sampleTest#56h",
            "password"      =>  "Sample@#23",
            "user_type"     =>   "1",
            "first_Name"    =>   true,
            "last_Name"     =>  "Test@$1",
            "email"         =>  "test17Sample181@gmailcom",
            "countryCode"  =>   001,
            "db_name"       =>  "user_crd657@#"
          ]
        ];
        $datasetTwo = [
          [
            "reg_id"        =>  "S@43278589",
            "user_name"     =>  "s@5mpleTest1",
            "password"      =>  "Sample@#23",
            "user_type"     =>  "7",
            "first_Name"    =>  "sample@@24",
            "last_Name"     =>  "Test#$1",
            "email"         =>  "Data1Sample101@^*gmail..com",
            "countryCode"  =>  "001SF",
            "db_name"       =>  "user6@_crd"
          ]
        ];
        $datasetThree = [
          [
            "reg_id"        =>   false,
            "user_name"     =>  "sample@$%Test1",
            "password"      =>  "Sample@#23",
            "user_type"     =>   true,
            "first_Name"    =>  "sample$%",
            "last_Name"     =>  "Test1@",
            "email"         =>   5789,
            "countryCode"  =>   01,
            "db_name"       =>  "user$#_crd"
          ]
        ];
        $datasetFour= [
          [
            "reg_id"        =>  "Sample",
            "user_name"     =>  "sample@4Test@",
            "password"      =>  "Sample@#23",
            "user_type"     =>   7,
            "first_Name"    =>  "Tsample@24",
            "last_Name"     =>  "Test1#$",
            "email"         =>  "test11Sample11gmail.com",
            "countryCode"  =>  "001",
            "db_name"       =>  "user_crd"
          ]
        ];
        $datasetFive = [
          [
            "reg_id"        =>  "43278589@!",
            "user_name"     =>  "sample*Test1",
            "password"      =>  "Sample@#23",
            "user_type"     =>   true,
            "first_Name"    =>  "sample@6#24",
            "last_Name"     =>  "Test1@#",
            "email"         =>  "tes9Data1Sample11@_gmail..com",
            "countryCode"  =>  "001",
            "db_name"       =>  "userdata57_crd"
          ]
        ];
      
        return
        [
          'negative test data set one'    => $datasetOne,
          'negative test data set two'    => $datasetTwo,
          'negative test  data set three' => $datasetThree,
          'negative test data set four'   => $datasetFour,
          'negative test data set five'   => $datasetFive
        ];
    }
     
     /**
     * Negative test Data where one parameter is not empty 
     * Use this data for validating assert condition to check all parameters are not empty
     * 
     * @return array
     */
    public function userDataNegativeTestDataWithOneParamter()
    {
        $datasetOne = [
          [
            "reg_id"        =>  "43278589",
            "user_name"     =>  "",
            "password"      =>  "",
            "user_type"     =>  "",
            "first_Name"    =>  "",
            "last_Name"     =>  "",
            "email"         =>  "",
            "countryCode"  =>  "",
            "db_name"       =>  ""
          ]
        ];
        $datasetTwo = [
          [
            "reg_id"        =>  "",
            "user_name"     =>  "sampleTest1",
            "password"      =>  "",
            "user_type"     =>  "",
            "first_Name"    =>  "",
            "last_Name"     =>  "",
            "email"         =>  "",
            "countryCode"  =>  "",
            "db_name"       =>  ""
          ] 
        ];
        $datasetThree = [
          [
            "reg_id"        =>  "",
            "user_name"     =>  "",
            "password"      =>  "Sample@#23",
            "user_type"     =>  "",
            "first_Name"    =>  "",
            "last_Name"     =>  "",
            "email"         =>  "",
            "countryCode"  =>  "",
            "db_name"       =>  ""
          ]
        ];
        $datasetFour = [
          [
            "reg_id"        =>  "",
            "user_name"     =>  "",
            "password"      =>  "",
            "user_type"     =>  "",
            "first_Name"    =>  "sample24",
            "last_Name"     =>  "",
            "email"         =>  "test11Data1Sample11@gmail.com",
            "countryCode"  =>  "",
            "db_name"       =>  ""
          ]
        ];
        $datasetFive = [
          [
            "reg_id"        =>  "",
            "user_name"     =>  "",
            "password"      =>  "Sample@#23",
            "user_type"     =>  "",
            "first_Name"    =>  "sample24",
            "last_Name"     =>  "",
            "email"         =>  "",
            "countryCode"  =>  "",
            "db_name"       =>  "user_crd"
          ]
        ];
      
      return
      [
        'negative test data set one'   => $datasetOne,
        'negative test data set two'   => $datasetTwo,
        'negative test data set three' => $datasetThree,
        'negative test data set four'  => $datasetFour,
        'negative test data set five'  => $datasetFive
        
      ];
    }
    
     /**
     * Negative test Data where only two parameters are not empty 
     * Use this data for validating assert condition where only two parameters are not empty
     * 
     * @return array
     */
    public function userDataWithParamtersEmpty()
    {  
        $datasetOne = [
          [
            "reg_id"        =>  "",
            "user_name"     =>  "stest1",
            "password"      =>  "TestSample@#23",
            "user_type"     =>  "",
            "first_Name"    =>  "",
            "last_Name"     =>  "",
            "email"         =>  "test11Data1Sample11gmail.com",
            "countryCode"  =>  "",
            "db_name"       =>  "user_crd"
          ]
        ];
        $datasetTwo = [
          [
            "reg_id"        =>  "",
            "user_name"     =>  "sampleTest1",
            "password"      =>  "",
            "user_type"     =>  "",
            "first_Name"    =>  "",
            "last_Name"     =>  "Test1#@%",
            "email"         =>  "",
            "countryCode"  =>  "",
            "db_name"       =>  ""
          ]
        ];
        $datasetThree = [
          [
            "reg_id"        =>  "",
            "user_name"     =>  "s@mple&Test1",
            "password"      =>  "Sample@#23",
            "user_type"     =>  "" ,
            "first_Name"    =>  "Sample@!24",
            "last_Name"     =>  "Test@#1",
            "email"         =>  "",
            "countryCode"  =>  "AUS001",
            "db_name"       =>  "user8@#crd"
          ]
        ];
        $datasetFour = [
          [
            "reg_id"        =>  "Sample",
            "user_name"     =>   1,
            "password"      =>  "Sample@#23",
            "user_type"     =>  "Test",
            "first_Name"    =>  "s@mple",
            "last_Name"     =>  "Te#st1",
            "email"         =>  "test11@..com",
            "countryCode"  =>  true,
            "db_name"       =>  657
          ]
        ];
        $datasetFive = [
          [
            "reg_id"        =>  "",
            "user_name"     =>  "sampleTest1",
            "password"      =>  "",
            "user_type"     =>   1,
            "first_Name"    =>  "T@s@mple24",
            "last_Name"     =>  "Test$1",
            "email"         =>  "test11@gmail_com",
            "countryCode"  =>   001,
            "db_name"       =>  ""
          ]
        ];
        $datasetSix = [
          [
            "reg_id"        =>  "",
            "user_name"     =>  true,
            "password"      =>  "",
            "user_type"     =>  "AUS",
            "first_Name"    =>  "",
            "last_Name"     =>  "Test1",
            "email"         =>  "",
            "countryCode"  =>  "",
            "db_name"       =>  ""
          ]
        ];
        
        return
        [
          'negative test data set one'   => $datasetOne,
          'negative test data set two'   => $datasetTwo,
          'negative test data set three' => $datasetThree,
          'negative test data set Four'  => $datasetFour,
          'negative test data set five'  => $datasetFive,
          'negative test data set six'   => $datasetSix
        ];
    }
}