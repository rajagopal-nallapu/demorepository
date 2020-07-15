<?php

use PHPUnit\Framework\Testcase;
use CRCSignup\Controller\Zapier;

class CreditHeroChallengeTest extends Testcase
{
    /**
     * @dataProvider CreditHeroChallengeZapierData::zapierWithPositiveTestData()
     * 
     * @group chc
     */
    public function test_SendingDataToZapierWithPositiveData(array $data)
    {
        $url = getenv('ZAPIER_CREDIT_HERO_CHALLENGE');

        $zapier_mock = Mockery::mock('Zapier');
        $zapier_mock->shouldReceive('makeRequest')->andReturn(true);

        $zapier_mock->url = $url;
        $zapier_mock->data = $data;

        $response = $zapier_mock->makeRequest();
        $this->assertTrue($response);

    }

    /**
     * @dataProvider CreditHeroChallengeZapierData::zapierWithPositiveTestData()
     * 
     * @group chc
     */
    public function test_SendingDataToZapierThrowsException(array $data)
    {
        $url = getenv('ZAPIER_CREDIT_HERO_CHALLENGE');

        $zapier_mock = Mockery::mock('Zapier');
        $zapier_mock->shouldReceive('makeRequest')
                    ->andThrow(new \Exception);

        $zapier_mock->url = $url;
        $zapier_mock->data = $data;

        $this->expectException(\Exception::class);
        $response = $zapier_mock->makeRequest();

    }
    
}