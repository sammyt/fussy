package uk.co.ziazoo.fussy.parser
{
  import flash.utils.Dictionary;

  import uk.co.ziazoo.fussy.model.Metadata;

  public class MetadataParser implements IResultParser
  {
    public function MetadataParser()
    {
      super();
    }

    public function parse(result:XMLList):Array
    {
      var metadata:Array = [];
      for each(var m:XML in result)
      {
        metadata.push(parseMetadata(m));
      }
      return metadata;
    }

    public function parseMetadata(reflection:XML):Metadata
    {
      var metadata:Metadata = new Metadata();
      metadata.name = reflection.@name;
      metadata.properties = new Dictionary();

      for each(var p:XML in reflection.arg)
      {
        metadata.properties[String(p.@key)] = String(p.@value);
      }
      return metadata;
    }
  }
}