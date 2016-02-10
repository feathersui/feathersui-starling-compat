package feathers.compat.tests
{
	import feathers.skins.Scale9ImageStateValueSelector;
	import feathers.textures.Scale9Textures;

	import flash.geom.Rectangle;

	import org.flexunit.Assert;

	import starling.display.Image;
	import starling.textures.Texture;

	public class Scale9ImageStateValueSelectorTests
	{
		private static const STATE_ONE:String = "stateOne";
		private static const STATE_TWO:String = "stateTwo";
		
		private var _valueSelector:Scale9ImageStateValueSelector;

		[Before]
		public function prepare():void
		{
			this._valueSelector = new Scale9ImageStateValueSelector();
		}

		[After]
		public function cleanup():void
		{
			this._valueSelector = null;
		}

		[Test]
		public function testScale9Textures():void
		{
			var defaultTextures:Scale9Textures = new Scale9Textures(Texture.fromColor(20, 20), new Rectangle(5, 5, 10, 10));
			var stateOneTextures:Scale9Textures = new Scale9Textures(Texture.fromColor(30, 30), new Rectangle(6, 6, 18, 18));

			this._valueSelector.defaultValue = defaultTextures;
			this._valueSelector.setValueForState(stateOneTextures, STATE_ONE);
			
			var result:Image = Image(this._valueSelector.updateValue({}, STATE_ONE, null));
			Assert.assertStrictlyEquals("Scale9ImageStateValueSelector did not set correct texture on Image from Scale9Textures using setValueForState()", result.texture, stateOneTextures.texture);
			Assert.assertTrue("Scale9ImageStateValueSelector did not set correct scale9Grid on Image from Scale9Textures using setValueForState()", result.scale9Grid.equals(stateOneTextures.scale9Grid));

			var secondResult:Image = Image(this._valueSelector.updateValue({}, STATE_TWO, result));
			Assert.assertStrictlyEquals("Scale9ImageStateValueSelector did not reuse Image for different Scale9Textures", result, secondResult);
			Assert.assertStrictlyEquals("Scale9ImageStateValueSelector did not set correct texture on Image from Scale9Textures using defaultValue", secondResult.texture, defaultTextures.texture);
			Assert.assertTrue("Scale9ImageStateValueSelector did not set correct scale9Grid on Image from Scale9Textures using defaultValue", secondResult.scale9Grid.equals(defaultTextures.scale9Grid));

			defaultTextures.texture.dispose();
			stateOneTextures.texture.dispose();
		}
	}
}
