package uk.co.ziazoo.fussy.query
{
  import uk.co.ziazoo.fussy.Type;
  import uk.co.ziazoo.fussy.accessors.AccessorQueryChain;
  import uk.co.ziazoo.fussy.methods.MethodQueryChain;
  import uk.co.ziazoo.fussy.parser.IResultParser;
  import uk.co.ziazoo.fussy.properties.PropertyQueryChain;
  import uk.co.ziazoo.fussy.variables.VariableQueryChain;

  public class Query
  {
    private var methodParser:IResultParser;
    private var propertyParser:IResultParser;
    private var constructorParser:IResultParser;

    public function Query(methodParser:IResultParser,
      propertyParser:IResultParser, constructorParser:IResultParser)
    {
      this.propertyParser = propertyParser;
      this.methodParser = methodParser;
      this.constructorParser = constructorParser;
    }

    public function type(type:Class):Type
    {
      return null;
    }

    public function forQName(qName:String):Type
    {
      return null;
    }

    public function findMethods():MethodQueryChain
    {
      return new MethodQueryChain(methodParser);
    }

    public function findProperties():PropertyQueryChain
    {
      return new PropertyQueryChain(propertyParser);
    }

    public function findAccessors():AccessorQueryChain
    {
      return new AccessorQueryChain(propertyParser);
    }

    public function findVariables():VariableQueryChain
    {
      return new VariableQueryChain(propertyParser);
    }
  }
}