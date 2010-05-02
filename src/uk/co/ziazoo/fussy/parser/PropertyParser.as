package uk.co.ziazoo.fussy.parser
{
  public class PropertyParser implements IResultParser
  {
    private var variableParser:VariableParser;
    private var accessorParser:AccessorParser;

    public function PropertyParser(variableParser:VariableParser,
      accessorParser:AccessorParser)
    {
      this.variableParser = variableParser;
      this.accessorParser = accessorParser;
    }

    public function parse(result:XMLList):Array
    {
      trace(result);
      var root:XML = <root/>;
      root.appendChild(result);

      var accessors:Array = accessorParser.parse(root.accessor);
      var variables:Array = variableParser.parse(root.variable);

      var properties:Array = accessors.concat(variables);
      return properties;
    }
  }
}