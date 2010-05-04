package uk.co.ziazoo.fussy.properties
{
  import uk.co.ziazoo.fussy.IReflector;
  import uk.co.ziazoo.fussy.parser.IResultParser;
  import uk.co.ziazoo.fussy.query.AbstractQueryChain;
  import uk.co.ziazoo.fussy.query.WithMetadata;

  public class PropertyQueryChain extends AbstractQueryChain
  {
    public function PropertyQueryChain(reflector:IReflector, parser:IResultParser)
    {
      super(reflector, parser);
    }

    // TODO: allow readable/writable queries on properties

    override protected function getList(reflection:XML):XMLList
    {
      var p:XMLList = new XMLList(<root/>);
      p.appendChild(reflection.factory.variable);
      p.appendChild(reflection.factory.accessor);
      return p.*;
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