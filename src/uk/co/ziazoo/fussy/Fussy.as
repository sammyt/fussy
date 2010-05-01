package uk.co.ziazoo.fussy
{
  import uk.co.ziazoo.fussy.query.Query;

  public class Fussy
  {
    public function Fussy()
    {
    }

    public function forType(type:Class):Type
    {
      return null;
    }

    public function forQName(qName:String):Type
    {
      return null;
    }

    public function query():Query
    {
      return new Query();
    }
  }
}