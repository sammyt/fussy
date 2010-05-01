package uk.co.ziazoo.fussy.parser
{
  import uk.co.ziazoo.fussy.model.Variable;

  public class VariableParser implements IResultParser
  {
    private var metadataParser:MetadataParser;

    public function VariableParser(metadataParser:MetadataParser)
    {
      this.metadataParser = metadataParser;
    }

    public function parse(result:XMLList):Array
    {
      var variables:Array = [];
      for each(var xml:XML in result)
      {
        variables.push(parseVariable(xml));
      }
      return variables;
    }

    private function parseVariable(reflection:XML):Variable
    {
      var property:Variable = new Variable();
      property.name = reflection.@name;
      property.type = reflection.@type;
      property.metadata = metadataParser.parse(reflection.metadata);
      return property;
    }
  }
}