package feathers.compat.tests
{
	import feathers.skins.SmartDisplayObjectStateValueSelector;
	import feathers.textures.Scale3Textures;
	import feathers.textures.Scale9Textures;

	import flash.geom.Rectangle;

	import org.flexunit.Assert;

	import starling.display.Image;
	import starling.display.Quad;
	import starling.textures.Texture;

	public class SmartDisplayObjectStateValueSelectorTests
	{
		private static const STATE_ONE:String = "stateOne";
		private static const STATE_TWO:String = "stateTwo";
		
		private var _valueSelector:SmartDisplayObjectStateValueSelector;

		[Before]
		public function prepare():void
		{
			this._valueSelector = new SmartDisplayObjectStateValueSelector();
		}

		[After]
		public function cleanup():void
		{
			this._valueSelector = null;
		}

		[Test]
		public function testColor():void
		{
			var defaultColor:uint = 0xff0000;
			var stateOneColor:uint = 0x0000ff;

			this._valueSelector.defaultValue = defaultColor;
			this._valueSelector.setValueForState(stateOneColor, STATE_ONE);

			var result:Quad = Quad(this._valueSelector.updateValue({}, STATE_ONE, null));
			Assert.assertStrictlyEquals("SmartDisplayObjectStateValueSelector did not set correct color on Quad from uint using setValueForState()", result.color, stateOneColor);

			var secondResult:Quad = Quad(this._valueSelector.updateValue({}, STATE_TWO, result));
			Assert.assertStrictlyEquals("SmartDisplayObjectStateValueSelector did not reuse Quad for different color", result, secondResult);
			Assert.assertStrictlyEquals("SmartDisplayObjectStateValueSelector did not set correct color on Quad from uint using defaultValue", secondResult.color, defaultColor);
		}

		[Test]
		public function testTexture():void
		{
			var defaultTexture:Texture = Texture.fromColor(20, 20);
			var stateOneTexture:Texture = Texture.fromColor(30, 30);

			this._valueSelector.defaultValue = defaultTexture;
			this._valueSelector.setValueForState(stateOneTexture, STATE_ONE);

			var result:Image = Image(this._valueSelector.updateValue({}, STATE_ONE, null));
			Assert.assertStrictlyEquals("SmartDisplayObjectStateValueSelector did not set correct texture on Image from Texture using setValueForState()", result.texture, stateOneTexture);

			var secondResult:Image = Image(this._valueSelector.updateValue({}, STATE_TWO, result));
			Assert.assertStrictlyEquals("SmartDisplayObjectStateValueSelector did not reuse Image for different Texture", result, secondResult);
			Assert.assertStrictlyEquals("SmartDisplayObjectStateValueSelector did not set correct texture on Image from Texture using defaultValue", secondResult.texture, defaultTexture);

			defaultTexture.dispose();
			stateOneTexture.dispose();
		}

		[Test]
		public function testScale3Textures():void
		{
			var defaultTextures:Scale3Textures = new Scale3Textures(Texture.fromColor(20, 20), 5, 10, Scale3Textures.DIRECTION_HORIZONTAL);
			var stateOneTextures:Scale3Textures = new Scale3Textures(Texture.fromColor(30, 30), 6, 18, Scale3Textures.DIRECTION_HORIZONTAL);

			this._valueSelector.defaultValue = defaultTextures;
			this._valueSelector.setValueForState(stateOneTextures, STATE_ONE);

			var result:Image = Image(this._valueSelector.updateValue({}, STATE_ONE, null));
			Assert.assertStrictlyEquals("SmartDisplayObjectStateValueSelector did not set correct texture on Image from Scale3Textures using setValueForState()", result.texture, stateOneTextures.texture);
			Assert.assertTrue("SmartDisplayObjectStateValueSelector did not set correct scale9Grid on Image from Scale3Textures using setValueForState()", result.scale9Grid.equals(stateOneTextures.scale9Grid));

			var secondResult:Image = Image(this._valueSelector.updateValue({}, STATE_TWO, result));
			Assert.assertStrictlyEquals("SmartDisplayObjectStateValueSelector did not reuse Image for different Scale9Textures", result, secondResult);
			Assert.assertStrictlyEquals("SmartDisplayObjectStateValueSelector did not set correct texture on Image from Scale3Textures using defaultValue", secondResult.texture, defaultTextures.texture);
			Assert.assertTrue("SmartDisplayObjectStateValueSelector did not set correct scale9Grid on Image from Scale3Textures using defaultValue", secondResult.scale9Grid.equals(defaultTextures.scale9Grid));

			defaultTextures.texture.dispose();
			stateOneTextures.texture.dispose();
		}

		[Test]
		public function testScale9Textures():void
		{
			var defaultTextures:Scale9Textures = new Scale9Textures(Texture.fromColor(20, 20), new Rectangle(5, 5, 10, 10));
			var stateOneTextures:Scale9Textures = new Scale9Textures(Texture.fromColor(30, 30), new Rectangle(6, 6, 18, 18));

			this._valueSelector.defaultValue = defaultTextures;
			this._valueSelector.setValueForState(stateOneTextures, STATE_ONE);
			
			var result:Image = Image(this._valueSelector.updateValue({}, STATE_ONE, null));
			Assert.assertStrictlyEquals("SmartDisplayObjectStateValueSelector did not set correct texture on Image from Scale9Textures using setValueForState()", result.texture, stateOneTextures.texture);
			Assert.assertTrue("SmartDisplayObjectStateValueSelector did not set correct scale9Grid on Image from Scale9Textures using setValueForState()", result.scale9Grid.equals(stateOneTextures.scale9Grid));

			var secondResult:Image = Image(this._valueSelector.updateValue({}, STATE_TWO, result));
			Assert.assertStrictlyEquals("SmartDisplayObjectStateValueSelector did not reuse Image for different Scale9Textures", result, secondResult);
			Assert.assertStrictlyEquals("SmartDisplayObjectStateValueSelector did not set correct texture on Image from Scale9Textures using defaultValue", secondResult.texture, defaultTextures.texture);
			Assert.assertTrue("SmartDisplayObjectStateValueSelector did not set correct scale9Grid on Image from Scale9Textures using defaultValue", secondResult.scale9Grid.equals(defaultTextures.scale9Grid));

			defaultTextures.texture.dispose();
			stateOneTextures.texture.dispose();
		}
	}
}
