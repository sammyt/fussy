package uk.co.ziazoo.fussy.accessors
{
  import uk.co.ziazoo.fussy.IReflector;
  import uk.co.ziazoo.fussy.parser.IResultParser;
  import uk.co.ziazoo.fussy.properties.PropertyQueryChain;

  public class AccessorQueryChain extends PropertyQueryChain
  {
    public function AccessorQueryChain(reflector:IReflector,
      parser:IResultParser)
    {
      super(reflector, parser);
    }

    override protected function getList(reflection:XML):XMLList
    {
      return reflection.factory.accessor;
    }

    public function readable():AccessorQueryChain
    {
      parts.push(new Readable());
      return this;
    }

    public function writable():AccessorQueryChain
    {
      parts.push(new Writable());
      return this;
    }

    public function readOnly():AccessorQueryChain
    {
      parts.push(new ReadOnly());
      return this;
    }

    public function writeOnly():AccessorQueryChain
    {
      parts.push(new WriteOnly());
      return this;
    }

    public function readAndWrite():AccessorQueryChain
    {
      parts.push(new ReadAndWrite());
      return this;
    }
  }
}