package uk.co.ziazoo.fussy.accessors
{
  import uk.co.ziazoo.fussy.query.IQueryPart;

  public class WriteOnly implements IQueryPart
  {
    public function WriteOnly()
    {
    }

    public function filter(data:XMLList):XMLList
    {
      return data.(
        @access == "writeonly"
        );
    }
  }
}