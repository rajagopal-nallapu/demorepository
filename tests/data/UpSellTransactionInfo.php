<?php

class UpSellTransactionInfo
{

        /**
         * positive test data to check the data is valid and not empty
         * 
         * @return array
         */
         public function UpSellDataWithPositiveTestData(){          
        return
        [
            'positive Test Data set one' => [
                [
                  "productDescription"  =>  "Sample product 1",
                  "currency"            =>  "USD",
                  "amount"              =>  "199",
                  "recurlyAccountCode"  =>  "8gshdfau2715TGW" 
            ]
        ],

            'positive Test Data set two' => [
                [
                  "productDescription"  =>  "Sample product 2",
                  "currency"            =>  "USD",
                  "amount"              =>  "199",
                  "recurlyAccountCode"  =>  "8gshdfau2715TGW" 
                ]

            ],

            'positive Test Data set three' => [
                [
                  "productDescription"  =>  "Sample product 3",
                  "currency"            =>  "USD",
                  "amount"              =>  "199",
                  "recurlyAccountCode"  =>  "8gshdfau2715TGW" 
                ]
            ]
        ];
    



        }
           
        /**
         * positive test data to check the data is valid and not empty
         * 
         * @return array
         */
        public function UpSellDataWithSecondPositiveTestData()
        {
            $datasetOne = [
              [
                "productDescription"  =>  "Sample test product",
                "currency"            =>  "USD",
                "amount"              =>  "599",
                "recurlyAccountCode"  =>  "hsbe729vsh238hs"     
              ]
            ];
            $datasetTwo = [
              [
                "productDescription"  =>  "Product test",
                "currency"            =>  "dollars",
                "amount"              =>  "399",
                "recurlyAccountCode"  =>  "793gsye782frt56"  
              ]
            ];
            $datasetThree = [
              [
                "productDescription"  =>  "test product sample",
                "currency"            =>  "USD",
                "amount"              =>  "299",
                "recurlyAccountCode"  =>  "bsj729shw234bsh"    
              ]
            ];
    
            return
            [
              'positive test data set one'   => $datasetOne,
              'positive test data set two'   => $datasetTwo,
              'positive test data set three' => $datasetThree    
            ];
        }
    
        /**
         * negative test data check the data is not valid
         * 
         * @return arrray
         */
        public function UpSellDataWithNegativeTestData()
        {
            return
            [
              'negative test data set one' => [
                "productDescription"  =>  "sample@ Product%$1",
                "currency"            =>  "USD56$",
                "amount"              =>  "Twenty7",
                "recurlyAccountCode"  =>  "hyw%hxhg72638k"       
              ],
              'negative test data set two' => [
                "productDescription"  =>  "TWEfsy ^@^@",
                "currency"            =>  "dOllars$",
                "amount"              =>  "5Tr",
                "recurlyAccountCode"  =>  "12344576152689#"
              ],
              'negative test data set three' => [
                "productDescription"  =>  "sample%412 Tsets",
                "currency"            =>  "C@nts",
                "amount"              =>  "3!@T",
                "recurlyAccountCode"  =>  "y^%$325ERT#uhyt"    
              ]
            ];
        }
    
        /**
         * negative test data where one parameter empty
         * 
         * @return array
         */
        public function UpSellDataWithOneParamEmpty()
        {
            $datasetOne = [
              [                
                "productDescription"  =>  "sample test description",
                "currency"            =>  "USD$",
                "amount"              =>  "199Y",
                "recurlyAccountCode"  =>  "hye643gst3th1tr"
              ]    
            ];
            $datasetTwo = [
              [                
                "productDescription"  =>  "",
                "currency"            =>  "dollar",
                "amount"              =>  "399@",
                "recurlyAccountCode"  =>  "f628yhei62getur"  
              ]
            ];
            $datasetThree = [
              [                
                "productDescription"  =>  "sample desciption",
                "currency"            =>  "",
                "amount"              =>  "199",
                "recurlyAccountCode"  =>  "hs6fr2usg23fdr#"      
              ]
            ];
            $datasetFour = [
              [                
                "productDescription"  =>  "test sample@52",
                "currency"            =>  "USD",
                "amount"              =>  "",
                "recurlyAccountCode"  =>  "q62tgsr527getyi"      
              ]
            ];
            $datasetFive = [
              [               
                "productDescription"  =>  "sample%",
                "currency"            =>  "USD",
                "amount"              =>  "349",
                "recurlyAccountCode"  =>  ""      
              ]
            ];
    
            return
            [
              "negative test data set one"    => $datasetOne,
              "negative test data set two"    => $datasetTwo,
              "negative test data set Three"  => $datasetThree,
              "negative test data set Four"   => $datasetFour,
              "negative test data set Five"   => $datasetFive
            ];
        }
    
        /**
         * negative test data where params are empty
         * 
         * @return Array
         */
        public function UpSellDataWithParamsEmpty()
        {
            return
            [
              'negative test data set one' => [                
                "productDescription"  =>  "",
                "currency"            =>  "",
                "amount"              =>  "399",
                "recurlyAccountCode"  =>  "h56riy4rty87trw"   
              ],
              'negative test data set two' => [                
                "productDescription"  =>  "Sample product",
                "currency"            =>  "USD",
                "amount"              =>  "199",
                "recurlyAccountCode"  =>  ""  
              ],
              'negative test data set three' => [                
                "productDescription"  =>  "",
                "currency"            =>  "dollars",
                "amount"              =>  "",
                "recurlyAccountCode"  =>  ""    
              ],
              'negative test data set four' => [                
                "productDescription"  =>  "sampl description",
                "currency"            =>  "USD",
                "amount"              =>  "",
                "recurlyAccountCode"  =>  ""          
              ],
              'negative test data set five' => [
                "productDescription"  =>  "Sample test description",
                "currency"            =>  "",
                "amount"              =>  "199",
                "recurlyAccountCode"  =>  ""    
              ]    
            ];   
        }
    
        /**
         * negative test data where all parameters are empty
         * 
         * @return array
         */
        public function UpSellDataWithAllParamsEmpty()
        {
            return [
                [[
                   
                   "productDescription"  =>  "",
                   "currency"            =>  "",
                   "account"             =>  "",
                   "recurlyAccountCode"  =>  ""
                ]]
              ];
        }
    }    