package uk.co.ziazoo.fussy.parser
{
  import org.flexunit.Assert;

  import uk.co.ziazoo.fussy.model.Method;

  public class MethodParserTest
  {
    public function MethodParserTest()
    {
    }

    [Test]
    public function parseSomeMethods():void
    {
      var parser:MethodParser = new MethodParser(
        new ParameterParser(), new MetadataParser());

      var root:XML = <root>
        <method name="doIt" declaredBy="uk.co.ziazoo.fussy::Bubbles" returnType="void">
          <parameter index="1" type="int" optional="true"/>
        </method>
        <method name="bebeboo" declaredBy="uk.co.ziazoo.fussy::Bubbles" returnType="void">
          <parameter index="1" type="Object" optional="false"/>
          <parameter index="2" type="Object" optional="false"/>
        </method>
        <method name="wowowo" declaredBy="uk.co.ziazoo.fussy::Bubbles" returnType="void">
          <parameter index="1" type="int" optional="false"/>
          <parameter index="2" type="String" optional="false"/>
          <metadata name="Inject"/>
        </method>
        <method name="bebeb" declaredBy="uk.co.ziazoo.fussy::Bubbles" returnType="void">
          <metadata name="Fussy">
            <arg key="thing" value="bacon"/>
          </metadata>
          <metadata name="Inject"/>
        </method>
      </root>

      var result:Array = parser.parse(root.method);

      Assert.assertNotNull(result);
      Assert.assertTrue(result.length == 4);
    }

    [Test]
    public function parseOne():void
    {
      var parser:MethodParser = new MethodParser(
        new ParameterParser(), new MetadataParser());

      var root:XML = <root>
        <method name="wowowo" declaredBy="uk.co.ziazoo.fussy::Bubbles" returnType="void">
          <parameter index="1" type="int" optional="false"/>
          <parameter index="2" type="String" optional="false"/>
          <metadata name="Inject"/>
        </method>
      </root>;

      var result:Array = parser.parse(root.method);

      Assert.assertNotNull(result);
      Assert.assertTrue(result.length == 1);

      var method:Method;
      method = result[0] as Method;

      Assert.assertTrue(method.name == "wowowo");
      Assert.assertTrue(method.parameters.length == 2);
      Assert.assertTrue(method.metadata.length == 1);
    }
  }
}