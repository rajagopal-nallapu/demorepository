<?php

class UserBillingInfo
{
     /**
     * Positive test Data where all parameters are not empty and valid
     * Use this data for validating assert condition to check all parameters are not empty
     * Use this data for validating assert condition to check all parameters are valid
     * 
     * @return array
     */
    public function userBillingInfoWithPositiveTestData()
    {
        $datasetOne = [
          [
            "fullAddress"    =>  "162 addressSample",
            "cityName"       =>  "Newyork",
            "state"          =>  "California",
            "zipcode"        =>  "96678",
            "recurly-token"  =>  "hdheuka67riebksswhshssiwyaleusodbwqy"
          ]
        ];
        $datasetTwo = [
          [
            "fullAddress"    =>  "147 Addresstest",
            "cityName"       =>  "San Francisco",
            "state"          =>  "virginia",
            "zipcode"        =>  "83962",
            "recurly-token"  =>  "qwusgw791hdheuka67riebksswhshsd"
          ]
        ];
        $datasetThree = [
          [
            "fullAddress"    =>  "629 address TestRoad",
            "cityName"       =>  "chicago",
            "state"          =>  "Indiana",
            "zipcode"        =>  "93749",
            "recurly-token"  =>  "JdjNb-cSiEPcAMUuNNZpfA"
          ]
        ];
        $datasetFour = [
          [
            "fullAddress"    =>  "948 testAddress street 8",
            "cityName"       =>  "hyderabad",
            "state"          =>  "Telangana",
            "zipcode"        =>  "73892",
            "recurly-token"  =>  "sjsgqyg61hjsbav16bjabaeuka67riebksswhshs"
          ]
        ];
        $datasetFive = [
          [
            "fullAddress"    =>  "283 street 9 testAddress",
            "cityName"       =>  "washington",
            "state"          =>  "Indiana",
            "zipcode"        =>  "78945",
            "recurly-token"  =>  "JdjNb-cSiEriebksswhsZpfA"
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
    public function userBillingInfoWithNegativeTestData()
    {
        $datasetOne = [
          [
            "fullAddress"    =>  "638 ^%$#ess",
            "cityName"       =>  "728394",
            "state"          =>  "Iowa&%$",
            "zipcode"        =>  "^#%829",
            "recurly-token"  =>  "suq*7hdheuka67riebksswhshs"
          ]
        ];
        $datasetTwo = [
          [
            "fullAddress"    =>  "Hteu&^20&",
            "cityName"       =>  "273Hy8",
            "state"          =>  "juwie13@@",
            "zipcode"        =>  "nshwihd",
            "recurly-token"  =>  "jajg^*jsaywhdheuka67riebksswhshs"
          ]
        ];
        $datasetThree = [
          [
            "fullAddress"    =>  "842 hwi4b&^#",
            "cityName"       =>  "$6teyd",
            "state"          =>  "&@*34638h",
            "zipcode"        =>  "72",
            "recurly-token"  =>  "skajdv&bjsva67riebksswhshs"
          ]
        ];
        $datasetFour= [
          [
            "fullAddress"    =>  "sje 728^%$ hsbd",
            "cityName"       =>  "indiana^54",
            "state"          =>  "^&87hO",
            "zipcode"        =>  "62577943689",
            "recurly-token"  =>  "hsjbHfwfuwijana7*ss(mah7riebksswhshs"
          ]
        ];
        $datasetFive = [
          [
            "fullAddress"    =>  "738 ^&*hsbdh",
            "cityName"       =>  "&6hsuz",
            "state"          =>  "virgina%^28",
            "zipcode"        =>  "98129#",
            "recurly-token"  =>  "ikwissja^kssg(djja)6sj7riebksswhshs"
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
    public function userBillingInfoNegativeTestDataWithOneParamter()
    {
        $datasetOne = [
          [
            "fullAddress"    =>  "283 testAddress street 23",
            "cityName"       =>  "",
            "state"          =>  "",
            "zipcode"        =>  "",
            "recurly-token"  =>  ""
          ]
        ];
        $datasetTwo = [
          [
            "fullAddress"    =>  "",
            "cityName"       =>  "",
            "state"          =>  "Indiana",
            "zipcode"        =>  "",
            "recurly-token"  =>  ""
          ] 
        ];
        $datasetThree = [
          [
            "fullAddress"    =>  "",
            "cityName"       =>  "Los Angeles",
            "state"          =>  "",
            "zipcode"        =>  "",
            "recurly-token"  =>  ""
          ]
        ];
        $datasetFour = [
          [
            "fullAddress"    =>  "",
            "cityName"       =>  "",
            "state"          =>  "",
            "zipcode"        =>  "72&8",
            "recurly-token"  =>  ""
          ]
        ];
        $datasetFive = [
          [
            "fullAddress"    =>  "",
            "cityName"       =>  "",
            "state"          =>  "",
            "zipcode"        =>  "",
            "recurly-token"  =>  "hdkysb76sjddjxmsgsk&&"
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
    public function userBillingInfoWithParamtersEmpty()
    {  
        $datasetOne = [
          [
            "fullAddress"    =>  "",
            "cityName"       =>  "california",
            "state"          =>  "",
            "zipcode"        =>  "829459R",
            "recurly-token"  =>  "hdkysb76sjddjxmsgsk&&"
          ]
        ];
        $datasetTwo = [
          [
            "fullAddress"    =>  "283 westroad street 6",
            "cityName"       =>  "",
            "state"          =>  "virginia",
            "zipcode"        =>  "",
            "recurly-token"  =>  "jkikysb76sjddjxmsgsk&&dhsyw"
          ]
        ];
        $datasetThree = [
          [
            "fullAddress"    =>  "",
            "cityName"       =>  "washington",
            "state"          =>  "",
            "zipcode"        =>  "7792470326",
            "recurly-token"  =>  "jkikysb76sjddjxmsgsk&&dh23dyrissyw"
          ]
        ];
        $datasetFour = [
          [
            "fullAddress"    =>  "382 testAddressSample",
            "cityName"       =>  "",
            "state"          =>  "Virginia",
            "zipcode"        =>  "8294722$",
            "recurly-token"  =>  "9))kikysb76sjddjxmsgsk&&dh23dyrissyw"
          ]
        ];
        $datasetFive = [
          [
            "fullAddress"    =>  "388 2 Sample test address ",
            "cityName"       =>  "",
            "state"          =>  "Indiana&",
            "zipcode"        =>  "",
            "recurly-token"  =>  ""
          ]
        ];
        $datasetSix = [
          [
            "fullAddress"    =>  "",
            "cityName"       =>  "california",
            "state"          =>  "",
            "zipcode"        =>  "826482I",
            "recurly-token"  =>  ""
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