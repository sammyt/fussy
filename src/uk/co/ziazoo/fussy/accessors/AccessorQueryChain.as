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
      /*filtered = getFiltered().(
        @access == "readwrite" || @access == "writeonly"
      );*/
      return this;
    }
    
    public function readOnly():AccessorQueryChain
    {
      /*filtered = getFiltered().(
        @access == "readonly"
      );*/
      return this;
    }
    
    public function writeOnly():AccessorQueryChain
    {
      /*filtered = getFiltered().(
        @access == "writeonly"
      );*/
      return this;
    }
    
    public function readAndWrite():AccessorQueryChain
    {
      /*filtered = getFiltered().(
        @access == "readwrite"
      );*/
      return this;
    }
  }
}