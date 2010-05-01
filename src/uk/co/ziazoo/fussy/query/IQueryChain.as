package uk.co.ziazoo.fussy.query
{
  import uk.co.ziazoo.fussy.parser.IResultParser;

  public interface IQueryChain extends IQuery
  {
    function addQueryPart(part:IQueryPart):void;

    function get parser():IResultParser;

    function set parser(value:IResultParser):void;
  }
}