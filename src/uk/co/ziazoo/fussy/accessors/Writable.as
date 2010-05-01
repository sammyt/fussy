package uk.co.ziazoo.fussy.accessors
{
  import uk.co.ziazoo.fussy.query.IQueryPart;

  public class Writable implements IQueryPart
  {
    public function Writable()
    {
    }

    public function filter(data:XMLList):XMLList
    {
      return data.(
        @access == "readwrite" || @access == "writeonly"
        );
    }
  }
}