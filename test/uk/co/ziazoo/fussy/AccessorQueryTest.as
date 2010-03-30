package uk.co.ziazoo.fussy
{
  import flash.utils.describeType;
  
  import org.flexunit.Assert;

  public class AccessorQueryTest
  {		
    [Test]
    public function filterOnType():void
    {
      var accessors:AccessorQuery = new AccessorQuery(describeType(Bubbles));
      var strings:XMLList = accessors.ofType(String).getResult();
      Assert.assertTrue("just onw", strings.length() == 1);
    }
    
    [Test]
    public function filterOnMetadata():void
    {
      var accessors:AccessorQuery = new AccessorQuery(describeType(Bubbles));
      var fussyLot:XMLList = accessors.withMetadata("Inject").getResult()
      Assert.assertTrue("only 1", fussyLot.length() == 1);
    }
    
    [Test]
    public function filterOnMetadataAndType():void
    {
      var accessors:AccessorQuery = new AccessorQuery(describeType(Bubbles));
      var fussyLot:XMLList = accessors.withMetadata("Inject").ofType(String).getResult();
      Assert.assertTrue("only 1", fussyLot.length() == 1);
    }
    
    [Test]
    public function filterOnMetadataAndTypeNotThere():void
    {
      var accessors:AccessorQuery = new AccessorQuery(describeType(Bubbles));
      var fussyLot:XMLList = accessors.withMetadata("Inject").ofType(Array).getResult();
      Assert.assertTrue("there are none", fussyLot.length() == 0);
    }
    
    [Test]
    public function findReadable():void
    {
      var accessors:AccessorQuery = new AccessorQuery(describeType(Bubbles));
      var readable:XMLList = accessors.readable().getResult();
      Assert.assertTrue("there are 2", readable.length() == 2);
      for each(var r:XML in readable)
      {
        Assert.assertTrue( ["sammy", "window"].indexOf(String(r.@name)) > -1 );
      }
    }
    
    [Test]
    public function findWritable():void
    {
      var accessors:AccessorQuery = new AccessorQuery(describeType(Bubbles));
      var writable:XMLList = accessors.writable().getResult();
      Assert.assertTrue("there are 2", writable.length() == 2);
      for each(var r:XML in writable)
      {
        Assert.assertTrue( ["thing", "window"].indexOf(String(r.@name)) > -1 );
      }
    }
    
    [Test]
    public function findReadOnly():void
    {
      var accessors:AccessorQuery = new AccessorQuery(describeType(Bubbles));
      var writable:XMLList = accessors.readOnly().getResult();
      Assert.assertTrue("just sammy", writable.length() == 1);
      for each(var r:XML in writable)
      {
        Assert.assertTrue( ["sammy"].indexOf(String(r.@name)) > -1 );
      }
    }
    
    [Test]
    public function findWriteOnly():void
    {
      var accessors:AccessorQuery = new AccessorQuery(describeType(Bubbles));
      var writable:XMLList = accessors.writeOnly().getResult();
      Assert.assertTrue("just thing", writable.length() == 1);
      for each(var r:XML in writable)
      {
        Assert.assertTrue( ["thing"].indexOf(String(r.@name)) > -1 );
      }
    }
    
    [Test]
    public function findReadAndWrite():void
    {
      var accessors:AccessorQuery = new AccessorQuery(describeType(Bubbles));
      var readWrite:XMLList = accessors.readAndWrite().getResult();
      Assert.assertTrue("just window", readWrite.length() == 1);
      for each(var r:XML in readWrite)
      {
        Assert.assertTrue( ["window"].indexOf(String(r.@name)) > -1 );
      }
    }
  }
}