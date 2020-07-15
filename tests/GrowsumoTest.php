<?php
use PHPUnit\Framework\TestCase;
class GrowsumoTest extends TestCase {
    /**
     * @dataProvider GrowsumoData::positiveTestDataOfGrowsumo()
     */
    public function test_GrowsumoInsertData($data) {
        
        $mockGrowsumoObj = $this->getMockBuilder(Partnestack::class)->setMethods([ 'updatePartnerStackCustomer'])->getMock();
        $mockGrowsumoObj->method('updatePartnerStackCustomer')->willReturn(true);
        $this->assertTrue($mockGrowsumoObj->updatePartnerStackCustomer($data));
    }
  
   
}
    