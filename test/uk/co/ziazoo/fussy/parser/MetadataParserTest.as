package uk.co.ziazoo.fussy.parser
{
  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.model.Metadata;

  public class MetadataParserTest
  {
    public function MetadataParserTest()
    {
    }

    [Test]
    public function parseSomeMetadata():void
    {
      var parser:MetadataParser = new MetadataParser();
      var root:XML = <root>
        <metadata name="Inject"/>
        <metadata name="Fussy">
          <arg key="thing" value="bacon"/>
        </metadata>
        <metadata name="Inject"/>
      </root>;

      var all:XMLList = root.metadata;

      var result:Array = parser.parse(all);

      Assert.assertNotNull(result);
      Assert.assertTrue(result.length == 3);
    }

    [Test]
    public function parseOne():void
    {
      var parser:MetadataParser = new MetadataParser();
      var root:XML = <root>
        <metadata name="Fussy">
          <arg key="thing" value="bacon"/>
        </metadata>
      </root>;

      var one:Array = parser.parse(root.metadata);

      var metadata:Metadata = one[0] as Metadata;

      Assert.assertNotNull(metadata);
      Assert.assertTrue(metadata.name == "Fussy");
      Assert.assertTrue(metadata.properties["thing"] == "bacon");
    }
  }
}