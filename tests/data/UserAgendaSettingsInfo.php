<?php

class UserAgendaSettingsInfo
{
     /**
     * Positive test Data where all parameters are not empty and valid
     * Use this data for validating assert condition to check all parameters are not empty
     * Use this data for validating assert condition to check all parameters are valid
     * 
     * @return array
     */
    public function userDataWithPositiveTestData()
    {
        $datasetOne = [
          [
            "user_id"     =>  "43278589",
            "send_email"  =>  "off"
          ]
        ];
        $datasetTwo = [
          [
            "user_id"     =>  "89954478857",
            "send_email"  =>  "on"
          ]
        ];
        $datasetThree = [
          [
            "user_id"     =>  "29549878589",
            "send_email"  =>  "off"
          ]
        ];
        $datasetFour = [
          [
            "user_id"     =>  "43277658589",
            "send_email"  =>  "on"
          ]
        ];
        $datasetFive = [
          [
            "user_id"     =>  "78668589",
            "send_email"  =>  "off"
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
            "user_id"     =>  "4327858987465",
            "send_email"  =>  "sampleTest#56h"
          ]
        ];
        $datasetTwo = [
          [
            "user_id"     =>  "S@43278589",
            "send_email"  =>   true
          ]
        ];
        $datasetThree = [
          [
            "user_id"     =>  false,
            "send_email"  =>  24
          ]
        ];
      
        return
        [
          'negative test data set one'    => $datasetOne,
          'negative test data set two'    => $datasetTwo,
          'negative test  data set three' => $datasetThree
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
            "user_id"        =>  "",
            "send_email"     =>  "stest1"
          ]
        ];
        $datasetTwo = [
          [
            "user_id"        =>  "SAmple",
            "send_email"     =>  ""
          ]
        ];
        $datasetThree = [
          [
            "user_id"        =>  "",
            "send_email"     =>  "s@mple&Test1"
          ]
        ];
        
        return
        [
          'negative test data set one'   => $datasetOne,
          'negative test data set two'   => $datasetTwo,
          'negative test data set three' => $datasetThree
        ];
    }
}