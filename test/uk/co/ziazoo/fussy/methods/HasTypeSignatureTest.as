package uk.co.ziazoo.fussy.methods
{
  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.Wibble;

  public class HasTypeSignatureTest
  {
    public function HasTypeSignatureTest()
    {
    }

    [Test]
    public function checkTypes():void
    {
      var queryPart:HasTypeSignature = new HasTypeSignature([int, String, Wibble]);

      var methods:XML = <root>
        <method name="bebeboo" declaredBy="uk.co.ziazoo.fussy::Bubbles" returnType="void">
          <parameter index="1" type="Object" optional="false"/>
          <parameter index="2" type="Object" optional="false"/>
        </method>
        <method name="demo" declaredBy="uk.co.ziazoo.fussy::Bubbles" returnType="void">
          <parameter index="1" type="int" optional="false"/>
          <parameter index="2" type="String" optional="false"/>
          <parameter index="3" type="uk.co.ziazoo.fussy::Wibble" optional="false"/>
          <metadata name="Inject"/>
        </method>
      </root>;

      var result:XMLList = queryPart.filter(methods.method);

      Assert.assertEquals(1, result.length());
      Assert.assertEquals("demo", result.@name);
    }
  }
}