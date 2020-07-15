<?php

class RecurlySubscriptionData
{
     /**
     * Positive test Data  where all parameters are not empty and valid
     * Use this data for validating assert condition to check all parameters are not empty
     * Use this data for validating assert condition to check all parameters are valid
     * 
     * @return array
     */
    public function recurlySubscriptionDataWithPositiveTestData()
    {
        $datasetOne = [
          [
            "accountCode"  =>  "hd728sge0gt3",
            "currency"    =>  "USD",
            "planCode"    =>  "cr_start",
          ]
        ];
        $datasetTwo = [
          [
            "accountCode"  =>  "jue724gsfe82g3",
            "currency"    =>  "INR",
            "planCode"    =>  "cr_grow",
          ]
        ];
        $datasetThree = [
          [
            "accountCode"  =>  "73hdtria74gsjd",
            "currency"    =>  "AUD",
            "planCode"    =>  "cr_scale",
          ]
        ];
        $datasetFour = [
          [
            "accountCode"  =>  "jteusf52gdjg383g",
            "currency"    =>  "NZD",
            "planCode"    =>  "cr_enterprise",
          ]
        ];
        $datasetFive = [
          [
            "accountCode"  =>  "sfje724sjsgeb",
            "currency"    =>  "AUD",
            "planCode"    =>  "cr_start",
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
     * Negative test Data  where only two  parameters are not  empty 
     * Use this data for validating assert condition where only two  parameters are not   empty
     * 
     * @return array
     */
    public function recurlySubscriptionDataWithAccountCodeEmpty()
    {  
        $datasetOne = [
          [
            "accountCode"  =>  false,
            "currency"    =>  "NZD",
            "planCode"    =>  "cr_grow",
          ]
        ];
        $datasetTwo = [
          [
            "accountCode"  =>  true,
            "currency"    =>  "AUD",
            "planCode"    =>  "cr_grow",
          ]
        ];
        $datasetThree = [
          [
            "accountCode"  =>  "",
            "currency"    =>  "USD",
            "planCode"    =>  "cr_start",
          ]
        ];
        $datasetFour = [
            [
              "accountCode"  =>  null,
              "currency"    =>  "AUD",
              "planCode"    =>  "cr_start",
            ]
        ];
        $datasetFive = [
          [
            "accountCode"  =>  "",
            "currency"    =>  "USD",
            "planCode"    =>  "cr_grow",
          ]
        ];
        $datasetSix = [
          [
            "accountCode"  =>  "",
            "currency"    =>  "USD",
            "planCode"    =>  "cr_grow",
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

    public function subscriptionIdProvider()
    {
        return [
            'set one'   => ["lxu2khci1veou6oixvp6"],
            'set two'   => ["ko15zxo2dwby5h6pjzfy"],
            'set three' => ["ve5f0vb91k8m6wjqnoko"],
            'set four'  => ["vobopgtonrjxvtcf1g41"],
            'set five'  => ["u1thrahsfl9ucvbt6lt0"],
            'set six'   => ["p9zz378c28ar8l2mu0xp"],
            'set seven' => ["zjhcv4j3szb9n50sol7x"]
        ];
    }
}


