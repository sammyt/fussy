package uk.co.ziazoo.fussy.properties
{
  import uk.co.ziazoo.fussy.query.AbstractQueryChain;
  import uk.co.ziazoo.fussy.query.WithMetadata;

  public class PropertyQueryChain extends AbstractQueryChain
  {
    public function PropertyQueryChain()
    {
    }

    public function ofType(type:Class):PropertyQueryChain
    {
      parts.push(new OfType(type));
      return this;
    }

    public function withMetadata(name:String):PropertyQueryChain
    {
      parts.push(new WithMetadata(name));
      return this;
    }
  }
}