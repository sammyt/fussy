package uk.co.ziazoo.fussy.parser
{
  import uk.co.ziazoo.fussy.model.Accessor;

  public class AccessorParser implements IResultParser
  {
    private var metadataParser:MetadataParser;

    public function AccessorParser(metadataParser:MetadataParser)
    {
      this.metadataParser = metadataParser;
    }

    public function parse(result:XMLList):Array
    {
      var accessors:Array = [];
      for each(var xml:XML in result)
      {
        accessors.push(parseAccessor(xml));
      }
      return accessors;
    }

    private function parseAccessor(reflection:XML):Accessor
    {
      var property:Accessor = new Accessor();
      property.name = reflection.@name;
      property.type = reflection.@type;
      property.declaredBy = reflection.@declaredBy;
      property.access = reflection.@access;
      property.metadata = metadataParser.parse(reflection.metadata);
      return property;
    }
  }
}