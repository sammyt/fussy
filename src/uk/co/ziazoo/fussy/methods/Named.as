package uk.co.ziazoo.fussy.methods
{
  import org.flexunit.runner.Result;
  
  import uk.co.ziazoo.fussy.query.IQueryPart;
  
  public class Named implements IQueryPart
  {
    private var name:String;
    
    public function Named(name:String)
    {
      this.name = name;
    }
    
    public function filter(data:XMLList):XMLList
    {
      return data.(@name == name);
    }
  }
}