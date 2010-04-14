package uk.co.ziazoo.fussy.query
{
  import uk.co.ziazoo.fussy.methods.MethodQueryChain;

  public class Query
  {
    public function Query()
    {
    }
    
    public function findMethods():MethodQueryChain
    {
      return new MethodQueryChain();
    }
  }
}