package uk.co.ziazoo.fussy
{
  import flash.utils.Dictionary;
  import flash.utils.describeType;
  
  import uk.co.ziazoo.fussy.query.Query;

  public class Fussy
  {
    public function Fussy()
    {
    }

    public function query():Query
    {
      return new Query();
    }
  }
}