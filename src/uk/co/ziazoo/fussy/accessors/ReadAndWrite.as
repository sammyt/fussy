package uk.co.ziazoo.fussy.accessors
{
  import uk.co.ziazoo.fussy.query.IQueryPart;

  public class ReadAndWrite implements IQueryPart
  {
    public function ReadAndWrite()
    {
    }

    public function filter(data:XMLList):XMLList
    {
      return data.(
        @access == "readwrite"
        );
    }
  }
}