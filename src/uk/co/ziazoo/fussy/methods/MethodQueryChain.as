package uk.co.ziazoo.fussy.methods
{
  import uk.co.ziazoo.fussy.query.IQueryChain;
  
  public class MethodQueryChain implements IQueryChain
  {
    private var parts:Array;
    
    public function MethodQueryChain()
    {
      this.parts = [];
    }
    
    public function named(name:String):MethodQueryChain
    {
      parts.push(new Named(name));
      return this;
    }
    
    public function forType(type:Class):void
    {
      
    }
  }
}