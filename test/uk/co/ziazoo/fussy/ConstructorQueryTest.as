package uk.co.ziazoo.fussy
{ 
  import flash.utils.describeType;
  
  import org.flexunit.Assert;
  
  public class ConstructorQueryTest
  {
    public function ConstructorQueryTest()
    {
      super();
    }
    
    [Test]
    public function doesItNeedAHack():void
    {
      var builder:ConstructorQuery = new ConstructorQuery(describeType(Bubbles));
      Assert.assertTrue("this one has a param so needs the hack", builder.needsHack());
    }
    
    [Test]
    public function doesItNeedAHackNope():void
    {
      var builder:ConstructorQuery = new ConstructorQuery(describeType(Wibble));
      Assert.assertFalse("this one has no params", builder.needsHack());
    }
  }
}