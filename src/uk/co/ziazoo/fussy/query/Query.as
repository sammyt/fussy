package uk.co.ziazoo.fussy.query
{
  import uk.co.ziazoo.fussy.IReflector;
  import uk.co.ziazoo.fussy.TypeDescription;
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
    private var metadataParser:IResultParser;
    private var reflector:IReflector;

    public function Query(reflector:IReflector, methodParser:IResultParser,
      propertyParser:IResultParser, constructorParser:IResultParser,
      metadataParser:IResultParser)
    {
      this.propertyParser = propertyParser;
      this.methodParser = methodParser;
      this.constructorParser = constructorParser;
      this.metadataParser = metadataParser;
      this.reflector = reflector;
    }

    public function getTypeQuery(type:Class):ITypeQuery
    {
      return new TypeQuery(reflector, constructorParser, metadataParser);
    }

    public function findMethods():MethodQueryChain
    {
      return new MethodQueryChain(reflector, methodParser);
    }

    public function findProperties():PropertyQueryChain
    {
      return new PropertyQueryChain(reflector, propertyParser);
    }

    public function findAccessors():AccessorQueryChain
    {
      return new AccessorQueryChain(reflector, propertyParser);
    }

    public function findVariables():VariableQueryChain
    {
      return new VariableQueryChain(reflector, propertyParser);
    }
  }
}