package uk.co.ziazoo.fussy.accessors
{
  import uk.co.ziazoo.fussy.properties.PropertyQueryChain;

  public class AccessorQueryChain extends PropertyQueryChain
  {
    public function AccessorQueryChain()
    {
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