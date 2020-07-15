<?php

namespace CRCSignup\Controller;

use CRCSignup\Controller\Recurly;

class RecurlyFactory
{
    public static function create(array $data)
    {
        try {
            $recurly = new Recurly();

            $recurly->setAccountCode();
            $recurly->setPlan();
            $recurly->setCurrency();

            $accountCode = $recurly->getAccountCode();

            $accountPayload = [
                "code" => $accountCode,
                "first_name" => $data['firstName'],
                "last_name" => $data['lastName'],
                "email" => $data['email']
            ];

            $billingInfoPayload = [
                'token_id'  => $data['recurly-token']
            ];

            $subscrptionPayload = [
                "plan_code" => $recurly->getPlan(),
                "currency" => $recurly->getCurrency(),
                "account" => [
                    "code" => $accountCode
                ],
            ];

            $response = $recurly->createAccount($accountPayload)
                                ->updateBillingInfo($accountCode, $billingInfoPayload)
                                ->createSubscription($subscrptionPayload)
                                ->getResponse();
            return $response;
        } catch (\Exception $e) {
            echo Recurly::EXCEPTION_MESSAGE;
        }
        
    }

    public static function charge(array $data)
    {
        try {
            $recurly = new Recurly();

            isset($data['currency']) ? $recurly->setCurrency($data['currency']) : $recurly->setCurrency();
            $recurly->setAccountCode($data['accountCode']);

            $accountCode = $recurly->getAccountCode();

            $purchaseObject = [
                "currency" => $recurly->getCurrency(),
                "account" => [
                    "code" => $accountCode,
                ],
                "line_items" => [
                    [
                        "currency" => $recurly->getCurrency(),
                        "unit_amount" => $data['amount'],
                        "description" => $data['productDescription'],
                        "type" => 'charge'
                    ]
                ]
            ];

            $response = $recurly->charge($purchaseObject);
            return $response;
        } catch (\Exception $e) {
            echo Recurly::EXCEPTION_MESSAGE;
        }
    }

    public function update(array $data)
    {
        try {
            $recurly = new Recurly();

            $recurly->setAccountCode($data['recurly_account_code']);
            $recurly->setPlan();
            $recurly->setCurrency();

            $accountCode = $recurly->getAccountCode();

            $accountPayload = [
                "code" => $accountCode,
                "first_name" => $data['firstName'],
                "last_name" => $data['lastName'],
                "email" => $data['email']
            ];

            $billingInfoPayload = [
                'token_id'  => $data['recurly-token']
            ];

            $subscrptionPayload = [
                "plan_code" => $recurly->getPlan(),
                "currency" => $recurly->getCurrency(),
                "account" => [
                    "code" => $accountCode
                ],
            ];
        
            
            if($data['recurly_account_code']===$accountCode)
            {
                $response['billing'] = $response->updateBillingInfo($accountCode, $billingInfoPayload)->getResponse();
                if($response['billing'])

            }else{
                $response['billing'] = "Billing Failed"
            }

                                // ->updateBillingInfo($accountCode, $billingInfoPayload)
                                // ->createSubscription($subscrptionPayload)
                                // ->getResponse();
                           

            return $response;
        } catch (\Exception $e) {
            echo Recurly::EXCEPTION_MESSAGE;
        }
    }
    
}