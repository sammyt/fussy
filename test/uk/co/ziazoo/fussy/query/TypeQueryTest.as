package uk.co.ziazoo.fussy.query
{
  import flash.utils.describeType;

  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.Bubbles;
  import uk.co.ziazoo.fussy.Reflector;
  import uk.co.ziazoo.fussy.TypeDescription;
  import uk.co.ziazoo.fussy.parser.ConstructorParser;
  import uk.co.ziazoo.fussy.parser.MetadataParser;
  import uk.co.ziazoo.fussy.parser.ParameterParser;

  public class TypeQueryTest
  {
    private var typeQuery:TypeQuery;

    public function TypeQueryTest()
    {
    }

    [Before]
    public function setUp():void
    {
      typeQuery = new TypeQuery(new Reflector(),
        new ConstructorParser(new ParameterParser()), new MetadataParser());
    }

    [After]
    public function tearDown():void
    {
      typeQuery = null;
    }

    [Test]
    public function getsTypeDescription():void
    {
      var description:TypeDescription = typeQuery.forType(Bubbles);

      Assert.assertEquals("uk.co.ziazoo.fussy::Bubbles", description.qName);
      Assert.assertEquals(true, description.isDynamic);
      Assert.assertEquals(true, description.isFinal);

      Assert.assertNotNull(description.constructor);
      Assert.assertNotNull(description.metadata);

      Assert.assertEquals(1, description.constructor.parameters.length);
      Assert.assertEquals(1, description.constructor.parameters.length);
      Assert.assertEquals(1, description.metadata.length);
    }
  }
}