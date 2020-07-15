<?php

use PHPUnit\Framework\TestCase;
use CRCSignup\Helper\Validator;

class ValidationTest extends TestCase
{
    
    /**
     * Validation Unit testing for user basic information information with positive data
     * @group validatedata
     * @group p1
     * 
     * @covers Validator::validateUserInformation
     * 
     * @dataProvider UserBasicInfo::userBasicInfoWithPositiveTestData()
     */
    public function test_UserBasicInfoWithPositiveData($data)
    {
        $validator = new Validator($data);

        $this->assertTrue($validator->validateUserInformation());
    }

    /**
     * Validation Unit testing for user basic information information with negative data
     * @group validatedata
     * @group p1
     * 
     * @covers Validator::validateUserInformation
     * 
     * @dataProvider UserBasicInfo::userBasicInfoWithNegativeTestData()
     */
    public function test_UserBasicInfoWithNegativeData($data)
    {
        $validator = new Validator($data);

        $this->assertIsArray($validator->validateUserInformation());
    }

    /**
     * Validation Unit testing for user basic information information with negative data
     * @group validatedata
     * @group p2
     * 
     * @dataProvider UserBasicInfo::userBasicInfoWithAllParametersAreEmpty()
     */
    public function test_UserBasicInfoWithEmptyParameters($data)
    {
        $validator = new Validator($data);

        $this->assertIsArray($validator->validateUserInformation());

    }

    /**
     * @dataProvider UserBasicInfo::dataProviderWithValidEmails()
     * @group single
     * 
     * @covers Validator::validateUserEmail()
     */
    public function test_ValidateUserEmailWithValidEmail($email)
    {
        $validator = new Validator(['email' => $email]);

        $this->assertTrue($validator->validateUserEmail());
    }

    /**
     * @dataProvider UserBasicInfo::dataProviderWithInvalidEmails()
     * @group single
     * 
     * @covers Validator::validateUserEmail()
     */
    public function test_ValidateUserEmailInValidEmail($email)
    {
        $validator = new Validator(['email' => $email]);

        $this->assertIsArray($validator->validateUserEmail());
    }

    /**
     * @dataProvider UserBasicInfo::dataProviderWithValidPassword()
     * @group single
     * 
     * @covers Validator::validateUserPassword()
     */
    public function test_ValidateUserEmailWithValidPassword($password)
    {
        $validator = new Validator(['password' => $password]);

        $this->assertTrue($validator->validateUserPassword());
    }

    /**
     * @dataProvider UserBasicInfo::dataProviderWithValidPassword()
     * @group single
     * 
     * @covers Validator::validateUserPassword()
     */
    public function test_ValidateUserPasswordLength($password)
    {
        $length = strlen($password);

        $this->assertTrue($length >= Validator::MIN_PASSWORD_LENGTH);
    }
}