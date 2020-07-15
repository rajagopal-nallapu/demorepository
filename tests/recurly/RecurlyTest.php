<?php

use PHPUnit\Framework\TestCase;
use CRCSignup\Controller\Recurly;

class RecurlyTest extends TestCase
{

    /**
     * Close the mockery object after all the tests execution
     */
    public function tearDown(): void
    {
        \Mockery::close();
    }

    /**
     * Test Recurly account is creatred or not with valid data
     * @dataProvider RecurlyMockData::recurlyMockInfoWithPositiveTestData()
     * 
     * @group account
     */
    public function test_AccountIsCreated(array $data)
    {
        $recurly_client = new Recurly();

        $recurly_client->setAccountCode();  

        $accountCode = $recurly_client->getAccountCode();

        $accountPayload = [
            "code" => $accountCode,
            "first_name" => $data['firstName'],
            "last_name" => $data['lastName'],
            "email" => $data['email']
        ];

        $recurly_mock = Mockery::mock('\Recurly\Client');
        $recurly_mock->shouldReceive('createAccount')
                     ->with(\Mockery::capture($accountPayload))
                     ->once();

        
        $recurly_client->setRecurly($recurly_mock);

        $response = $recurly_client->createAccount($accountPayload)->getResponse();

        $this->assertInstanceOf(\Recurly\Resources\Account::class,new $response['account']);
    }

   
    /**
     * Test account creation is throwing exception or not 
     * if account code is empty or not provided
     * 
     * @group account
     */
    public function test_RecurlyCreateAccountThrowsAnException()
    {
        $recurly_client = new Recurly();

        $accountPayload = [];
        $recurly_mock = Mockery::mock('\Recurly\Client');
        $recurly_mock->shouldReceive('createAccount')
                        ->with(\Mockery::capture($accountPayload))
                        ->andThrow(new \Recurly\Errors\Validation('Account code must be provided'));

        $recurly_client->setRecurly($recurly_mock);
        
        $this->expectException(\Recurly\Errors\Validation::class);
        $recurly_client->createAccount($accountPayload);
    }

    /**
     * Test Recurly subscription is created or not with valid data
     * @dataProvider RecurlySubscriptionData::recurlySubscriptionDataWithPositiveTestData()
     * 
     * @group subscription
     */
    public function test_SubscriptionIsCreated($data)
    {
        $recurly_client = new Recurly();

        $recurly_client->setPlan($data['planCode']);
        $recurly_client->setCurrency($data['currency']);

        $payload = [
            "plan_code" => $recurly_client->getPlan(),
            "currency" => $recurly_client->getCurrency(),
            "account" => [
                "code" => $data['accountCode']
            ],
        ];

        $recurly_mock = Mockery::mock('\Recurly\Client');
        $recurly_mock->shouldReceive('createSubscription')
                     ->with(\Mockery::capture($payload))
                     ->once();

        
        $recurly_client->setRecurly($recurly_mock);

        $response = $recurly_client->createSubscription($payload)->getResponse();

        $this->assertInstanceOf(\Recurly\Resources\Subscription::class,new $response['subscription']);
    }

    /**
     * Test creation of subscription is throwing exception
     * if account is not proivded or not valid
     * @dataProvider RecurlySubscriptionData::recurlySubscriptionDataWithAccountCodeEmpty()
     * 
     * @group subscription
     */
    public function test_CreateSubscriptionWithAccountCodeEmpty($data)
    {
        $recurly_client = new Recurly();

        $recurly_client->setPlan($data['planCode']);
        $recurly_client->setCurrency($data['currency']);

        $payload = [
            "plan_code" => $recurly_client->getPlan(),
            "currency" => $recurly_client->getCurrency(),
            "account" => [
                "code" => $data['accountCode']
            ],
        ];
        $recurly_mock = Mockery::mock('\Recurly\Client');
        $recurly_mock->shouldReceive('createSubscription')
                        ->with(\Mockery::capture($payload))
                        ->andThrow(new \Recurly\Errors\Validation('Account code must be provided'));

        $recurly_client->setRecurly($recurly_mock);
        
        $this->expectException(\Recurly\Errors\Validation::class);
        $recurly_client->createSubscription($payload);
    }

    /**
     * Test get subscription information from Recurly
     * @dataProvider RecurlySubscriptionData::subscriptionIdProvider()
     * 
     * @group subscription
     */
    public function test_GetSubscriptionById($subscriptionId)
    {
        $recurly_client = new Recurly();

        $recurly_mock = Mockery::mock('\Recurly\Client');
        $recurly_mock->shouldReceive('getSubscription')
                        ->with(\Mockery::capture($subscriptionId))
                        ->once();

        $recurly_client->setRecurly($recurly_mock);
        
        $response = $recurly_client->getSubscriptionInformation($subscriptionId);

        $this->assertInstanceOf(\Recurly\Resources\Subscription::class,new $response);
    }

    /**
     * Test get account information from Recurly
     * @dataProvider RecurlyMockData::accountCodeProvider()
     * 
     * @group account
     */
    public function test_GetAccountById($accountCode)
    {
        $recurly_client = new Recurly();

        $recurly_mock = Mockery::mock('\Recurly\Client');
        $recurly_mock->shouldReceive('getAccount')
                        ->with(\Mockery::capture($accountCode))
                        ->once();

        $recurly_client->setRecurly($recurly_mock);
        
        $response = $recurly_client->getAccountInformation($accountCode);

        $this->assertInstanceOf(\Recurly\Resources\Account::class,new $response);
    }

    /**
     * Test get account information throws error if account code is wrong
     * @dataProvider RecurlyMockData::accountCodeProvider()
     * 
     * @group account
     */
    public function test_GetAccountByCodeWithWrongCode($accountCode)
    {
        $recurly_client = new Recurly();

        $recurly_mock = Mockery::mock('\Recurly\Client');
        $recurly_mock->shouldReceive('getAccount')
                        ->with(\Mockery::capture($accountCode))
                        ->andThrow(new \Recurly\RecurlyError(Recurly::EXCEPTION_MESSAGE));

        $recurly_client->setRecurly($recurly_mock);

        $this->assertEquals(Recurly::EXCEPTION_MESSAGE, $recurly_client->getAccountInformation($accountCode));
    }

    /**
     * Test get subscription information throws error if id is wrong
     * @dataProvider RecurlySubscriptionData::subscriptionIdProvider()
     * 
     * @group subscription
     */
    public function test_GetSubscriptionByIdWithError($subscriptionId)
    {
        $recurly_client = new Recurly();

        $recurly_mock = Mockery::mock('\Recurly\Client');
        $recurly_mock->shouldReceive('getSubscription')
                        ->with(\Mockery::capture($subscriptionId))
                        ->andThrow(new \Recurly\RecurlyError('Subscription ID does not exist'));

        $recurly_client->setRecurly($recurly_mock);
        
        $this->assertEquals(Recurly::EXCEPTION_MESSAGE, $recurly_client->getSubscriptionInformation($subscriptionId));
    }

    /**
     * Test get account information throws error if account code is empty
     * @group account
     */
    public function test_GetAccountByCodeWithEmptyCode()
    {
        $recurly_client = new Recurly();

        $accountCode = '';

        $recurly_mock = Mockery::mock('\Recurly\Client');
        $recurly_mock->shouldReceive('getAccount')
                        ->with(\Mockery::capture($accountCode))
                        ->andThrow(new \Recurly\Errors\Validation('Invalid Account Code'));

        $recurly_client->setRecurly($recurly_mock);
        
        $this->expectException(\Recurly\Errors\Validation::class);
        $recurly_client->getAccountInformation($accountCode);
    }

    /**
     * Test get subscription information throws error if subscription id is empty
     * @group subscription
     */
    public function test_GetSubscriptionByIdWithEmptyId()
    {
        $recurly_client = new Recurly();

        $subscriptionId = '';

        $recurly_mock = Mockery::mock('\Recurly\Client');
        $recurly_mock->shouldReceive('getSubscription')
                        ->with(\Mockery::capture($subscriptionId))
                        ->andThrow(new \Recurly\Errors\Validation('Invalid Subscription ID'));

        $recurly_client->setRecurly($recurly_mock);
        
        $this->expectException(\Recurly\Errors\Validation::class);
        $recurly_client->getAccountInformation($subscriptionId);
    }
}