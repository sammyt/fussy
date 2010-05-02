package uk.co.ziazoo.fussy.variables
{
  import uk.co.ziazoo.fussy.parser.IResultParser;
  import uk.co.ziazoo.fussy.properties.PropertyQueryChain;

  public class VariableQueryChain extends PropertyQueryChain
  {
    public function VariableQueryChain(parser:IResultParser)
    {
      super(parser);
    }

    override protected function getList(reflection:XML):XMLList
    {
      return reflection.factory.varaible;
    }
  }
}