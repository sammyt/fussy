package uk.co.ziazoo.fussy
{
  import flex.lang.reflect.Method;
  
  import uk.co.ziazoo.fussy.parser.MetadataParser;
  import uk.co.ziazoo.fussy.parser.MethodParser;
  import uk.co.ziazoo.fussy.parser.ParameterParser;

  public class QueryBuilder
  {
    private var description:XML;
    
    public function QueryBuilder(description:XML)
    {
      this.description = description;
    }
    
    public function findMethods():MethodQuery
    {
      return new MethodQuery(description, 
        new MethodParser(new ParameterParser(), new MetadataParser()));
    }
    
    public function findVariables():VariableQuery
    {
      return new VariableQuery(description);
    }
    
    public function findAccessors():AccessorQuery
    {
      return new AccessorQuery(description);
    }
    
    public function findProperties():PropertyQuery
    {
      return new PropertyQuery(description);
    }
    
    public function findConstructor():ConstructorQuery
    {
      return new ConstructorQuery(description);
    }
  }
}