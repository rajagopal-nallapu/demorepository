<?php
use PHPUnit\Framework\TestCase;
use CRCSignup\Controller\Recurly;
use CRCSignup\Controller\Upsell;
class UpSellTest extends TestCase {
 
      /**
      * @dataProvider UpSellTransactionInfo::UpSellDataWithPositiveTestData()
      * 
      * @group upsell
      */
      public function test_RecurlyIsCapturingAmountForUpsell($data)
      {        
          $recurly_client = new Recurly();
          $recurly_client->setCurrency($data['currency']);
          $purchaseObject = [
                                "currency"   => $recurly_client->getCurrency(),
                                "account"    => [  "code" => $data['recurlyAccountCode'], ],
                                "line_items" => [
                                                    [
                                                    "currency"    => $recurly_client->getCurrency(),
                                                    "unit_amount" => $data['amount'],
                                                    "description" => $data['productDescription'],
                                                    "type"        => 'charge'
                                                    ]
                                                 ]
                            ];
          $recurly_mock = Mockery::mock('\Recurly\Client');
          $recurly_mock->shouldReceive('createPurchase')
           ->with(\Mockery::capture($purchaseObject))
           ->once();
          $recurly_client->setRecurly($recurly_mock);
          $response = $recurly_client->charge($purchaseObject);
          $this->assertInstanceOf(\Recurly\Resources\InvoiceCollection::class,new $response);    
       
      }

    /**
     * @dataProvider UpSellTransactionInfo::UpSellDataWithPositiveTestData()
     * 
     * @group upsell
    */
    public function test_UpSellDataWithPositiveTestData($data)
    {     
       $upsellData = new Upsell($data);
       $this->assertFalse($upsellData->validateUpsellpurchaseData());           
    }    
}    