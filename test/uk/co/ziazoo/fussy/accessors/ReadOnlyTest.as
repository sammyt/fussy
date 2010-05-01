package uk.co.ziazoo.fussy.accessors
{
  import flash.utils.describeType;

  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.Bubbles;

  public class ReadOnlyTest
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
      var readOnly:ReadOnly = new ReadOnly();
      var result:XMLList = readOnly.filter(accessors);
      Assert.assertNotNull(result);
      Assert.assertTrue(result.length() == 1);
    }
  }
}