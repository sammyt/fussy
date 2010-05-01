package uk.co.ziazoo.fussy.query
{
  import uk.co.ziazoo.fussy.accessors.AccessorQueryChain;
  import uk.co.ziazoo.fussy.methods.MethodQueryChain;
  import uk.co.ziazoo.fussy.model.Constructor;
  import uk.co.ziazoo.fussy.parser.MetadataParser;
  import uk.co.ziazoo.fussy.parser.MethodParser;
  import uk.co.ziazoo.fussy.parser.ParameterParser;
  import uk.co.ziazoo.fussy.properties.PropertyQueryChain;
  import uk.co.ziazoo.fussy.variables.VariableQueryChain;

  public class Query
  {
    private var methodParser:MethodParser;
    private var parameterParser:ParameterParser;
    private var metadataParser:MetadataParser;

    public function Query()
    {
    }

    public function findMethods():MethodQueryChain
    {
      return new MethodQueryChain(getMetadataParser());
    }

    public function findProperties():PropertyQueryChain
    {
      return new PropertyQueryChain();
    }

    public function findAccessors():AccessorQueryChain
    {
      return new AccessorQueryChain();
    }

    public function findVariables():VariableQueryChain
    {
      return new VariableQueryChain();
    }

    private function getMethodParser():MethodParser
    {
      if (!methodParser)
      {
        methodParser = new MethodParser(getParameterParser(), getMetadataParser());
      }
      return methodParser;
    }

    private function getParameterParser():ParameterParser
    {
      if (!parameterParser)
      {
        parameterParser = new ParameterParser();
      }
      return parameterParser;
    }

    private function getMetadataParser():MetadataParser
    {
      if (!metadataParser)
      {
        metadataParser = new MetadataParser();
      }
      return metadataParser;
    }
  }
}