<?php

use PHPUnit\Framework\TestCase;
use CRCSignup\Helper\Validator;
use Valitron\Validator as Valitron;

class ValidateBillingInfoTest extends TestCase
{
    
    /**
     * Validation Unit testing for user billing information information with positive data
     * @group validatedata
     * @group p1
     * 
     * @covers Validator::validateBillingInfo
     * 
     * @dataProvider UserBillingInfo::userBillingInfoWithPositiveTestData()
     */
    public function test_UserBillingInfoWithPositiveData($data)
    {
        $validator = new Validator($data);

        $this->assertTrue($validator->validateBillingInfo());
    }

    /**
     * Validation Unit testing for user basic information information with negative data
     * @group validatedata
     * @group p1
     * 
     * @covers Validator::validateBillingInfo
     * 
     * @dataProvider UserBillingInfo::userBillingInfoWithNegativeTestData()
     */
    public function test_UserBasicInfoWithNegativeData($data)
    {
        $validator = new Validator($data);

        $this->assertIsArray($validator->validateBillingInfo());
    }

    /**
     * Validation Unit testing for user basic information information with negative data
     * @group validatedata
     * @group p2
     * 
     * @dataProvider UserBillingInfo::userBillingInfoNegativeTestDataWithOneParamter()
     */
    public function test_UserBasicInfoWithEmptyParameters($data)
    {
        $validator = new Validator($data);

        $this->assertIsArray($validator->validateBillingInfo());

    }
}