/*
feathers-compat
Copyright 2016 Bowler Hat LLC. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.textures
{
	import flash.geom.Rectangle;

	import starling.textures.Texture;

	/**
	 * Slices a Starling Texture into nine regions to be used by <code>Scale9Image</code>.
	 *
	 * @see feathers.display.Scale9Image
	 */
	public final class Scale9Textures
	{
		/**
		 * @private
		 */
		private static const ZERO_WIDTH_ERROR:String = "The width of the scale9Grid must be greater than zero.";

		/**
		 * @private
		 */
		private static const ZERO_HEIGHT_ERROR:String = "The height of the scale9Grid must be greater than zero.";

		/**
		 * @private
		 */
		private static const SUM_X_REGIONS_ERROR:String = "The sum of the x and width properties of the scale9Grid must be less than or equal to the width of the texture.";

		/**
		 * @private
		 */
		private static const SUM_Y_REGIONS_ERROR:String = "The sum of the y and height properties of the scale9Grid must be less than or equal to the height of the texture.";

		/**
		 * Constructor.
		 *
		 * @param texture        A Starling Texture to slice up into nine regions. It is recommended to turn of mip-maps for best rendering results.
		 * @param scale9Grid    The rectangle defining the region in the horizontal center and vertical middle, with other regions being calculated automatically. This value should be based on the original texture dimensions, with no adjustments for scale factor.
		 */
		public function Scale9Textures(texture:Texture, scale9Grid:Rectangle)
		{
			if(scale9Grid.width <= 0)
			{
				throw new ArgumentError(ZERO_WIDTH_ERROR);
			}
			if(scale9Grid.height <= 0)
			{
				throw new ArgumentError(ZERO_HEIGHT_ERROR);
			}
			if((scale9Grid.x + scale9Grid.width) > texture.frameWidth)
			{
				throw new ArgumentError(SUM_X_REGIONS_ERROR);
			}
			if((scale9Grid.y + scale9Grid.height) > texture.frameHeight)
			{
				throw new ArgumentError(SUM_Y_REGIONS_ERROR);
			}
			this._texture = texture;
			this._scale9Grid = scale9Grid;
		}

		/**
		 * @private
		 */
		private var _texture:Texture;

		/**
		 * The original texture.
		 */
		public function get texture():Texture
		{
			return this._texture;
		}

		/**
		 * @private
		 */
		private var _scale9Grid:Rectangle;

		/**
		 * The grid representing the nine sub-regions of the texture.
		 */
		public function get scale9Grid():Rectangle
		{
			return this._scale9Grid;
		}
	}
}

