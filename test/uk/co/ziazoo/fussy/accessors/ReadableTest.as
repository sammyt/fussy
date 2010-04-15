package uk.co.ziazoo.fussy.accessors
{
  import flash.utils.describeType;
  
  import org.flexunit.Assert;
  
  import uk.co.ziazoo.fussy.Bubbles;
  import uk.co.ziazoo.fussy.properties.OfType;
  
  public class ReadableTest
  {
    private var accessors:XMLList;
    
    [Before]
    public function setUp():void
    {
      var description:XML = describeType(Bubbles);
      accessors = description.factory.accessor; 
    }
    
    [After]
    public function tearDown():void
    {
      accessors = null;
    }
    
    [Test]
    public function all_readable_accessors():void
    {
      var readable:Readable = new Readable();
      var result:XMLList = readable.filter(accessors);
      Assert.assertNotNull(result);
      Assert.assertTrue(result.length() == 2);
    }
  }
}