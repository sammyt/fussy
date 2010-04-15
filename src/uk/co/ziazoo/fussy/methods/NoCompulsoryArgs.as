package uk.co.ziazoo.fussy.methods
{
  import uk.co.ziazoo.fussy.query.IQueryPart;
  
  public class NoCompulsoryArgs implements IQueryPart
  {
    public function NoCompulsoryArgs()
    {
    }
    
    public function filter(data:XMLList):XMLList
    {
      return data.( 
        !hasOwnProperty("parameter") || parameter.@optional == "true"
      );
    }
  }
}