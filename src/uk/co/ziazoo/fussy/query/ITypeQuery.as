package uk.co.ziazoo.fussy.query
{
  import uk.co.ziazoo.fussy.TypeDescription;

  public interface ITypeQuery
  {
    function forType(type:Class):TypeDescription;

    function forQName(qName:String):TypeDescription;
  }
}