package uk.co.ziazoo.fussy.query
{
  public interface IQueryPart
  {
    function filter(data:XML):IQueryPartResult;
  }
}