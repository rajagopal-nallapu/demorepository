<?php

namespace CRCSignup\Controller;

use CRCSignup\Interfaces\IRecurly;


/**
 * CRC Signup module Recurly Handler
 * Handles end to end communication with Recurly
 */
class Recurly implements IRecurly
{

    /**
     * Recurly instance
     * @var Recurly $recurly Recurly client object
     */
    private \Recurly\Client $recurly;

    /**
     * Recurly API Key to authorize each request
     * @var string $apiKey
     */
    private static $apiKey;

    const EXCEPTION_MESSAGE = 'An unexpected error occurred. Please try again later';

    /**
     * Account code prefix string
     * Recurly account can be fetched usin account_id or account_code.
     * If we are passing account code we should pass "code-" as prefix
     */
    const ACCOUNT_CODE_PREFIX = 'code-';

    /** Default plan code for the new user */
    const DEFAULT_PLAN = 'cr_start';

    /** Default currency code*/
    const DEFAULT_CURRENCY = 'USD';

    /** Variable to store the plan code */
    private string $plan;

    /** Variable to store currency code */
    private string $currency;

    /** Variable to store the recurly account code */
    private string $accountCode;

    /** Varibale to store the recurly response */
    private array $response;

    /**
     * constructor
     * Authorize the account on instance
     */
    public function __construct()
    {
        $this->authorize();
    }

    /**
     * Generates new account code to create an account in Recurly
     * 
     * @return string The generated account code
     */
    private function _generateNewAccountCode(): string
    {
        return md5(microtime(true).mt_Rand());
    }

    /**
     * Authorize recurly using API key
     * Provides recurly client object if authorized
     * 
     * @return Object Recurly client object
     * @throws Exception If authorization failed
     */
    public function authorize()
    {
        try {
            static::$apiKey = getenv('RECURLY_API_KEY');
            $client = new \Recurly\Client(static::$apiKey);
            $this->setRecurly($client);
        } catch (\Exception $e) {
            echo static::EXCEPTION_MESSAGE; exit();
        }
    }

    public function setRecurly(\Recurly\Client $recurly)
    {
        $this->recurly = $recurly;
    }

    /**
     * get account code as Recurly format
     * Adds a prefix to the account code
     * 
     * @param string $accountCode The Recurly account code
     * 
     * @return string The account code with prefix added
     */
    private static function _getAccountCodeWithPrefix(string $accountCode): string
    {
        return static::ACCOUNT_CODE_PREFIX.$accountCode;
    }

    /**
     * Set account code for the user
     * If we provide account code it wll be assigned, else it will generate new one
     * 
     * @return void
     */
    public function setAccountCode(string $accountCode = ''): void
    {
        $this->accountCode = !empty($accountCode) ? $accountCode : self::_generateNewAccountCode();
    }

    /**
     * Set the plan for the user
     * We can provide plan, otherwise it will assign the default plan - cr_start
     * 
     * @return void
     */
    public function setPlan(string $plan = self::DEFAULT_PLAN): void
    {
        $this->plan = $plan;
    }

    /** Set the plan for the user
     * We can provide currency code, otherwise it will assign the default currency - USD
     * 
     * @return void
     */
    public function setCurrency(string $currency = self::DEFAULT_CURRENCY): void
    {
        $this->currency = $currency;
    }

    /**
     * Get account code for the user
     * 
     * @return string The account code
     */
    public function getAccountCode(): string
    {
        return $this->accountCode;
    }

    /**
     * Get plan code
     * 
     * @return string The the plan code
     */
    public function getPlan(): string
    {
        return $this->plan;
    }

    /**
     * Get plan currency code
     * 
     * @return string The the currency code
     */
    public function getCurrency(): string
    {
        return $this->currency;
    }

    /**
     * Creates Recurly account
     * 
     * @param array $payload User information to create the account
     * 
     * @return Object Recurly account object
     * @throws \Recurly\Errors\Validation if payload validation fails
     * @throws \Recurly\RecurlyError if error in request or bad request types
     */
    public function createAccount(array $payload)
    {
        if( !isset($payload['code']) || 
            $payload['code'] == '' ||
            !is_string($payload['code'])
        )
        {
            throw new \Recurly\Errors\Validation('Account code must be provided');
        }

        try {
            $account = $this->recurly->createAccount($payload);
           $this->response['account'] = $account;
           return $this;
        
        } catch (\Recurly\Errors\Validation $e) {
            return $e->getMessage();
          
        } catch (\Recurly\RecurlyError $e) {
            return static::EXCEPTION_MESSAGE;
        }
    }

    public function updateAccount(array $payload)
    {
        if( !isset($payload['code']) || 
            $payload['code'] == '' ||
            !is_string($payload['code'])
        )
        {
            throw new \Recurly\Errors\Validation('Account code must be provided');
        }

        try {
            $account = $this->recurly->updateAccount($payload);
           $this->response['account'] = $account;
           return $this;
        
        } catch (\Recurly\Errors\Validation $e) {
            return $e->getMessage();
          
        } catch (\Recurly\RecurlyError $e) {
            return static::EXCEPTION_MESSAGE;
        }
    }
    

    /**
     * Creates Recurly subscription
     * 
     * @return Object Recurly subscription object
     * @throws \Recurly\Errors\Validation if payload validation fails
     * @throws \Recurly\RecurlyError if error in request or bad request types
     */
    public function createSubscription(array $payload)
    {

        if( !isset($payload['account']['code']) || 
            $payload['account']['code'] == '' ||
            !is_string($payload['account']['code']) 
            )
        {
            throw new \Recurly\Errors\Validation('Account code must be provided');
        }

        try {
            $subscription = $this->recurly->createSubscription($payload);
            $this->response['subscription'] = $subscription;
            print_r($this->response['subscription']);
            return $this;
        } catch (\Recurly\Errors\Validation $e) {
            return $e->getMessage();
        } catch (\Recurly\RecurlyError $e) {
            return static::EXCEPTION_MESSAGE;
        }
    }

    /**
     * Updates user billing information
     * We need to pass Recurly.Js token to update the information
     * 
     * @return Object Recurly subscription object
     * @throws \Recurly\Errors\Validation if payload validation fails
     * @throws \Recurly\RecurlyError if error in request or bad request types
     */
    public function updateBillingInfo(string $accountCode, array $payload)
    {
        try {
           $accountCode = self::_getAccountCodeWithPrefix($accountCode);
            $billigInfo = $this->recurly->updateBillingInfo($accountCode, $payload);
            $this->response['billingInfo'] = $billigInfo;
            return $this;
        } catch (\Recurly\Errors\Validation $e) {
            return $e->getMessage();
        } catch (\Recurly\RecurlyError $e) {
            return static::EXCEPTION_MESSAGE;
        }
    }

    /**
     * Get Recurly account information
     * 
     * @param string $accountCode Recurly Account code
     * 
     * @return Object Recurly account object
     * @throws \Recurly\Errors\NotFound if accound code not found
     * @throws \Recurly\RecurlyError if error in request or bad request types
     */
    public function getAccountInformation(string $accountCode)
    {
        if(empty($accountCode))
        {
            throw new \Recurly\Errors\Validation('Invalid Account Code');
        }

        try {
            $account = $this->recurly->getAccount(self::_getAccountCodeWithPrefix($accountCode));
            return $account;
        } catch (\Recurly\Errors\NotFound $e) {
            return 'Could not find account.' . PHP_EOL;
        } catch (\Recurly\RecurlyError $e) {
            return static::EXCEPTION_MESSAGE;
        }
    }

    /**
     * Get response from Recurly 
     * 
     * @return array The response object
     */
    public function getResponse(): array
    {
        return $this->response;
    }

     /**
     * Get Recurly subscription information
     * 
     * @param string $subscriptionId Recurly subscription id
     * 
     * @return Object Recurly subscription object
     * @throws \Recurly\Errors\NotFound if accound code not found
     * @throws \Recurly\RecurlyError if error in request or bad request types
     */
    public function getSubscriptionInformation(string $subscriptionId)
    {
        if(empty($subscriptionId))
        {
            throw new \Recurly\Errors\Validation('Invalid Subscription ID');
        }

        try {
            $subscription = $this->recurly->getSubscription($subscriptionId);
            return $subscription;
        } catch (\Recurly\Errors\NotFound $e) {
            return 'Could not find subscription.' . PHP_EOL;
        } catch (\Recurly\RecurlyError $e) {
            return static::EXCEPTION_MESSAGE;
        }
    }

    /**
     * Collects payment for the user
     * 
     * @return Object Recurly invoice object
     * @throws \Recurly\Errors\Validation if payload validation fails
     * @throws \Recurly\RecurlyError if error in request or bad request types
     */
    public function charge(array $payload)
    {
        try {
            $invoice_collection = $this->recurly->createPurchase($payload);
           return $invoice_collection;
        } catch (\Recurly\Errors\Validation $e) {
            return $e->getMessage();
        } catch (\Recurly\RecurlyError $e) {
            return static::EXCEPTION_MESSAGE;
        }        
    }

}