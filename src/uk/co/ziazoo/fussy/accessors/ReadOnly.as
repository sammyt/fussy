package uk.co.ziazoo.fussy.accessors
{
  import uk.co.ziazoo.fussy.query.IQueryPart;

  public class ReadOnly implements IQueryPart
  {
    public function ReadOnly()
    {
    }

    public function filter(data:XMLList):XMLList
    {
      return data.(
        @access == "readonly"
        );
    }
  }
}