package uk.co.ziazoo.fussy.methods
{
  import uk.co.ziazoo.fussy.query.IQueryPart;

  public class NoArgs implements IQueryPart
  {
    public function NoArgs()
    {
    }
    
    public function filter(data:XMLList):XMLList
    {
      return data.( 
        !hasOwnProperty("parameter")
      );
    }
  }
}