package feathers.compat.tests
{
	import feathers.skins.ImageStateValueSelector;
	import feathers.skins.SmartDisplayObjectStateValueSelector;
	import feathers.textures.Scale3Textures;
	import feathers.textures.Scale9Textures;

	import flash.geom.Rectangle;

	import org.flexunit.Assert;

	import starling.display.Image;
	import starling.display.Quad;
	import starling.textures.Texture;

	public class ImageStateValueSelectorTests
	{
		private static const STATE_ONE:String = "stateOne";
		private static const STATE_TWO:String = "stateTwo";

		private var _valueSelector:ImageStateValueSelector;

		[Before]
		public function prepare():void
		{
			this._valueSelector = new ImageStateValueSelector();
		}

		[After]
		public function cleanup():void
		{
			this._valueSelector = null;
		}

		[Test]
		public function testTexture():void
		{
			var defaultTexture:Texture = Texture.fromColor(20, 20);
			var stateOneTexture:Texture = Texture.fromColor(30, 30);

			this._valueSelector.defaultValue = defaultTexture;
			this._valueSelector.setValueForState(stateOneTexture, STATE_ONE);

			var result:Image = Image(this._valueSelector.updateValue({}, STATE_ONE, null));
			Assert.assertStrictlyEquals("ImageStateValueSelector did not set correct texture on Image from Texture using setValueForState()", result.texture, stateOneTexture);

			var secondResult:Image = Image(this._valueSelector.updateValue({}, STATE_TWO, result));
			Assert.assertStrictlyEquals("ImageStateValueSelector did not reuse Image for different Texture", result, secondResult);
			Assert.assertStrictlyEquals("ImageStateValueSelector did not set correct texture on Image from Texture using defaultValue", secondResult.texture, defaultTexture);

			defaultTexture.dispose();
			stateOneTexture.dispose();
		}
	}
}
