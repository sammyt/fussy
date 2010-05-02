package uk.co.ziazoo.fussy.parser
{
  import flash.utils.describeType;

  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.Bubbles;
  import uk.co.ziazoo.fussy.model.Accessor;
  import uk.co.ziazoo.fussy.model.Metadata;
  import uk.co.ziazoo.fussy.model.Property;
  import uk.co.ziazoo.fussy.model.Variable;

  public class PropertyParserTest
  {
    private var parser:PropertyParser;

    public function PropertyParserTest()
    {
    }

    [Before]
    public function setUp():void
    {
      var metadataParser:MetadataParser = new MetadataParser();
      parser = new PropertyParser(
        new VariableParser(metadataParser),
        new AccessorParser(metadataParser));
    }

    [Test]
    public function tearDown():void
    {
      parser = null;
    }


    [Test]
    public function parseSomeProperties():void
    {
      var description:XML = describeType(Bubbles);
      var p:XMLList = new XMLList(<root/>);
      p.appendChild(description.factory.variable);
      p.appendChild(description.factory.accessor);
      var props:XMLList = p.*;

      trace(props);

      var properties:Array = parser.parse(props);

      Assert.assertNotNull(properties);
      Assert.assertTrue(properties.length == 7);
    }

    [Test]
    public function canParseVariable():void
    {
      var v:XMLList = new XMLList(<root>
        <variable name="wibble" type="uk.co.ziazoo.fussy::Wibble"/>
      </root>);

      var properties:Array = parser.parse(v.*);

      Assert.assertNotNull(properties);
      Assert.assertTrue(properties.length == 1);

      var prop:Variable = properties[0] as Variable;

      Assert.assertEquals("wibble", prop.name);
      Assert.assertEquals("uk.co.ziazoo.fussy::Wibble", prop.type);
    }

    [Test]
    public function canParseAccessor():void
    {
      var v:XMLList = new XMLList(<root>
        <accessor name="thing" access="writeonly" type="String" declaredBy="uk.co.ziazoo.fussy::Bubbles">
          <metadata name="Inject"/>
        </accessor>
      </root>);

      var properties:Array = parser.parse(v.*);

      Assert.assertNotNull(properties);
      Assert.assertTrue(properties.length == 1);

      var prop:Accessor = properties[0] as Accessor;

      Assert.assertEquals("thing", prop.name);
      Assert.assertEquals("String", prop.type);
      Assert.assertEquals(1, prop.metadata.length);
      Assert.assertEquals("writeonly", prop.access);
      Assert.assertEquals("uk.co.ziazoo.fussy::Bubbles", prop.declaredBy);
    }
  }
}