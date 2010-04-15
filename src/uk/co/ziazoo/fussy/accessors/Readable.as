package uk.co.ziazoo.fussy.accessors
{
  import uk.co.ziazoo.fussy.query.IQueryPart;
  
  public class Readable implements IQueryPart
  {
    public function Readable()
    {
    }
    
    public function filter(data:XMLList):XMLList
    {
      return data.(
        @access == "readwrite" || @access == "readonly"
      );
    }
  }
}