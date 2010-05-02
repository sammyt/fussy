package uk.co.ziazoo.fussy.query
{
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
      var query:Query = new Query(null, null, null);
      query.findMethods().named("getEtc");
    }
  }
}