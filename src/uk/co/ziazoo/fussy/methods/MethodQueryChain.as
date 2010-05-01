package uk.co.ziazoo.fussy.methods
{
  import uk.co.ziazoo.fussy.parser.IResultParser;
  import uk.co.ziazoo.fussy.query.AbstractQueryChain;
  import uk.co.ziazoo.fussy.query.Named;
  import uk.co.ziazoo.fussy.query.WithMetadata;

  public class MethodQueryChain extends AbstractQueryChain
  {
    public function MethodQueryChain(parser:IResultParser)
    {
      this.parser = parser;
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