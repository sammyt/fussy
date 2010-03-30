package uk.co.ziazoo.fussy
{
  public class QueryBuilder
  {
    private var description:XML;
    
    public function QueryBuilder(description:XML)
    {
      this.description = description;
    }
    
    public function findMethods():MethodQuery
    {
      return new MethodQuery(description);
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
  }
}