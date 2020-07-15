<?php
use PHPUnit\Framework\TestCase;
use CRCSignup\Libraries\Database;
use CRCSignup\Model\User;
class UserAccessTest extends TestCase {
    /**
     * @dataProvider UserAccessinfo::UserAccessWithPositiveTestData()
     */
    public function test_UserAccessMockData($data) {
        $userModel = new User();
       // $db        = Mockery::mock('Database');
        $db        = $this->getMockBuilder(Database::class)->setMethods(['__construct'])->setConstructorArgs(getenv('DEFAULT_DATABASE'))->getMock();
        $db->shouldReceive('insert')->once();
        $userModel->setDatabaseObject($db);
        
        $this->assertGreaterThan(0,$userModel->saveUserAccess($data));  
    }
}