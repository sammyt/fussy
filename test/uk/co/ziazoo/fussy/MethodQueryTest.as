package uk.co.ziazoo.fussy
{
  import flash.utils.describeType;
  
  import org.flexunit.Assert;
  
  import uk.co.ziazoo.fussy.parser.MetadataParser;
  import uk.co.ziazoo.fussy.parser.MethodParser;
  import uk.co.ziazoo.fussy.parser.ParameterParser;

  public class MethodQueryTest
  {		
    private function getMethodParser():MethodParser
    {
      return new MethodParser(new ParameterParser(), new MetadataParser());
    }
    
    [Test]
    public function withParams():void
    {
      var methods:MethodQuery = 
        new MethodQuery(describeType(Wibble), getMethodParser());
      var result:XMLList = methods.argLength(1).getResult();      
      Assert.assertTrue("one method", result.length() == 1);
    }
    
    [Test]
    public function withMetadata():void
    {
      var methods:MethodQuery = 
        new MethodQuery(describeType(Wibble), getMethodParser());
      var result:XMLList = methods.withMetadata("Inject").getResult();      
      Assert.assertTrue("one method", result.length() == 1);
    }
    
    [Test]
    public function metadataAndParams():void
    {
      var methods:MethodQuery = 
        new MethodQuery(describeType(Bubbles), getMethodParser());
      var result:XMLList = methods.withMetadata("Inject").argLength(2).getResult();
      Assert.assertTrue("one method", result.length() == 1);
    }
    
    [Test]
    public function moreMetadata():void
    {
      var methods:MethodQuery = 
        new MethodQuery(describeType(Bubbles), getMethodParser());
      var result:XMLList = methods.withMetadata("Inject").getResult();
      Assert.assertTrue("two methods", result.length() == 2);
    }
    
    [Test]
    public function noArgs():void
    {
      var methods:MethodQuery = 
        new MethodQuery(describeType(Bubbles), getMethodParser());
      var result:XMLList = methods.noArgs().getResult();
      Assert.assertTrue("two methods", result.length() == 1);
    }
  }
}