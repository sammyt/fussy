package uk.co.ziazoo.fussy.accessors
{
  import flash.utils.describeType;

  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.Bubbles;

  public class WriteOnlyTest
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
      var writeOnly:WriteOnly = new WriteOnly();
      var result:XMLList = writeOnly.filter(accessors);
      Assert.assertNotNull(result);
      Assert.assertTrue(result.length() == 1);
    }
  }
}