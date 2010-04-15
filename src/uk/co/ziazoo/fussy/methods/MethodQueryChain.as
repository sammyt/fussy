package uk.co.ziazoo.fussy.methods
{
  import uk.co.ziazoo.fussy.query.AbstractQueryChain;
  import uk.co.ziazoo.fussy.query.WithMetadata;
  
  public class MethodQueryChain extends AbstractQueryChain
  {
    public function MethodQueryChain()
    {
    }
    
    public function named(name:String):MethodQueryChain
    {
      parts.push(new Named(name));
      return this;
    }
    
    public function withMetadata(named:String):MethodQueryChain
    {
      parts.push(new WithMetadata(named));
      return this;
    }
  }
}