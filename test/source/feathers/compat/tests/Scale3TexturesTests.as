package feathers.compat.tests
{
	import feathers.textures.Scale3Textures;

	import flash.geom.Rectangle;

	import org.flexunit.Assert;

	import starling.textures.Texture;

	public class Scale3TexturesTests
	{
		private var _scale3Textures:Scale3Textures;

		[Before]
		public function prepare():void
		{
		}

		[After]
		public function cleanup():void
		{
			if(this._scale3Textures.texture)
			{
				this._scale3Textures.texture.dispose();
			}
			this._scale3Textures = null;
		}

		[Test]
		public function testHorizontalScale9Grid():void
		{
			this._scale3Textures = new Scale3Textures(Texture.fromColor(20, 40), 5, 10, Scale3Textures.DIRECTION_HORIZONTAL);
			Assert.assertTrue("Scale3Textures scale9Grid not correct when direction is horizontal", this._scale3Textures.scale9Grid.equals(new Rectangle(5, 0, 10, 40)));
		}

		[Test]
		public function testVerticalScale9Grid():void
		{
			this._scale3Textures = new Scale3Textures(Texture.fromColor(20, 40), 5, 10, Scale3Textures.DIRECTION_VERTICAL);
			Assert.assertTrue("Scale3Textures scale9Grid not correct when direction is vertical", this._scale3Textures.scale9Grid.equals(new Rectangle(0, 5, 20, 10)));
		}
	}
}
