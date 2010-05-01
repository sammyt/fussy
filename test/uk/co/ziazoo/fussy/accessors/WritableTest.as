package uk.co.ziazoo.fussy.accessors
{
  import flash.utils.describeType;

  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.Bubbles;

  public class WritableTest
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
    public function all_writeable_accessors():void
    {
      var writeable:Writable = new Writable();
      var result:XMLList = writeable.filter(accessors);
      Assert.assertNotNull(result);
      Assert.assertTrue(result.length() == 2);
    }
  }
}