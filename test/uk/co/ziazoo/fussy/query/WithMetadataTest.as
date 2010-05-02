package uk.co.ziazoo.fussy.query
{
  import flash.utils.describeType;

  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.Bubbles;

  public class WithMetadataTest
  {
    private var methods:XMLList;
    private var props:XMLList;

    [Before]
    public function setUp():void
    {
      methods = describeType(Bubbles).factory.method;
      var p:XMLList = new XMLList(<root/>);
      p.appendChild(describeType(Bubbles).factory.variable);
      p.appendChild(describeType(Bubbles).factory.accessor);
      props = p.*;
    }

    [After]
    public function tearDown():void
    {
      methods = null;
    }

    [Test]
    public function filters():void
    {
      var withMetadata:WithMetadata = new WithMetadata("Inject");
      var result:XMLList = withMetadata.filter(methods);
      Assert.assertNotNull(result);
      Assert.assertTrue(result.length() == 2);
    }

    [Test]
    public function filterOnProps():void
    {
      var withMetadata:WithMetadata = new WithMetadata("Inject");
      var result:XMLList = withMetadata.filter(props);
      Assert.assertTrue(result.length() == 1);
    }
  }
}