package uk.co.ziazoo.fussy.query
{
  import uk.co.ziazoo.fussy.accessors.AccessorQueryChain;
  import uk.co.ziazoo.fussy.methods.MethodQueryChain;
  import uk.co.ziazoo.fussy.properties.PropertyQueryChain;
  import uk.co.ziazoo.fussy.variables.VariableQueryChain;

  public class Query
  {
    public function Query()
    {
    }

    public function findMethods():MethodQueryChain
    {
      return new MethodQueryChain(null);
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
  }
}