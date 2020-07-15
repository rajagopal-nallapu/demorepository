<?php
use PHPUnit\Framework\TestCase;
class ZapierTest extends TestCase {
    /**
     * @dataProvider AbandonedUserInfo::positiveTestDataOfZapTwo()
     */
    public function test_ZapierForAbnondedCart($data) {
        $url = "https://hooks.zapier.com/hooks/catch/6936710/o52q97g/";
        $mock_zapier = $this->getMockBuilder(Zapier::class)->setMethods(['__construct', 'makeRequest'])->setConstructorArgs([$url, $data])->getMock();
        $mock_zapier->method('makeRequest')->willReturn(true);
        $this->assertTrue($mock_zapier->makeRequest());
    }
}
    