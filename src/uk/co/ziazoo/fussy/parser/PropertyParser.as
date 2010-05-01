package uk.co.ziazoo.fussy.parser
{
  import uk.co.ziazoo.fussy.model.Property;

  public class PropertyParser implements IResultParser
  {
    private var metadataParser:MetadataParser;

    public function PropertyParser(metadataParser:MetadataParser)
    {
      this.metadataParser = metadataParser;
    }

    public function parse(result:XMLList):Array
    {
      var props:Array = [];
      for each(var property:XML in result)
      {
        props.push(parseProperty(property));
      }
      return props;
    }

    public function parseProperty(reflection:XML):Property
    {
      var property:Property = new Property();
      property.name = reflection.@name;
      property.type = reflection.@type;
      property.metadata = metadataParser.parse(reflection.metadata);
      return property;
    }
  }
}