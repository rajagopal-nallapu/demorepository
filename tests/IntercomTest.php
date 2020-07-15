<?php
use PHPUnit\Framework\TestCase;
class IntercomTest extends TestCase {
    /**
     * @dataProvider IntercomData::positiveTestDataOfIntercomcompanies()
     */
    public function test_IntercomForsendcompaniesData($data) {
        
        $mockintercomObj = $this->getMockBuilder(Intercom::class)->setMethods([ 'intercomRequest'])->getMock();
        $mockintercomObj->method('intercomRequest')->willReturn(true);
        $this->assertTrue($mockintercomObj->intercomRequest('companies',$data));
    }
    /**
     * @dataProvider IntercomData::positiveTestDataOfIntercomUsers()
     */
    public function test_IntercomForsendusersData($data) {
        
        $mockintercomObj = $this->getMockBuilder(Intercom::class)->setMethods([ 'intercomRequest'])->getMock();
        $mockintercomObj->method('intercomRequest')->willReturn(true);
        $this->assertTrue($mockintercomObj->intercomRequest('users',$data));
    }
    /**
     * @dataProvider IntercomData::positiveTestDataOfIntercomTags
     ()
     */
    public function test_IntercomForsendtagsData($data) {
        
        $mockintercomObj = $this->getMockBuilder(Intercom::class)->setMethods([ 'intercomRequest'])->getMock();
        $mockintercomObj->method('intercomRequest')->willReturn(true);
        $this->assertTrue($mockintercomObj->intercomRequest('tags',$data));
    }
}
    