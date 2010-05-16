package uk.co.ziazoo.fussy.query
{
  import uk.co.ziazoo.fussy.accessors.AccessorQueryChain;
  import uk.co.ziazoo.fussy.methods.MethodQueryChain;
  import uk.co.ziazoo.fussy.properties.PropertyQueryChain;
  import uk.co.ziazoo.fussy.variables.VariableQueryChain;

  public interface IQueryBuilder
  {
    function getTypeQuery():ITypeQuery;

    function findMethods():MethodQueryChain;

    function findProperties():PropertyQueryChain;

    function findAccessors():AccessorQueryChain;

    function findVariables():VariableQueryChain;
  }
}