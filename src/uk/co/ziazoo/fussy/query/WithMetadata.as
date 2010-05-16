package uk.co.ziazoo.fussy.query
{

  dynamic public class WithMetadata implements IQueryPart
  {
    private var name:String;

    public function WithMetadata(name:String)
    {
      this.name = name;
    }

    public function filter(data:XMLList):XMLList
    {
      var a:String = data.toString();
      return data.(
        hasOwnProperty("metadata") && metadata.(@name == name).length() > 0
        );
    }
  }
}