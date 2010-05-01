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
      var metadatas:Array = [];
      for each(var metadata:XML in result)
      {
        metadatas.push(parseMetadata(metadata));
      }
      return null;
    }

    public function parseMetadata(reflection:XML):Metadata
    {
      var metadata:Metadata = new Metadata();
      metadata.name = reflection.@name;
      metadata.properties = new Dictionary();

      for each(var p:XML in reflection.arg)
      {
        metadata.properties[p.@key as String] = p.@value as String;
      }
      return metadata;
    }
  }
}