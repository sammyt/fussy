package uk.co.ziazoo.fussy.query
{
  import uk.co.ziazoo.fussy.Fussy;

  public class QueryTest
  {		
    [Before]
    public function setUp():void
    {
    }
    
    [After]
    public function tearDown():void
    {
    }
    
    [Test]
    public function creation():void
    {
      var query:Query = new Query();
      query.findMethods().named("getEtc");
      
      
      
    }
  }
}