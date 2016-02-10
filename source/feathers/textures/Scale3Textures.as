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
	 * Slices a Starling Texture into three regions to be used by <code>Scale3Image</code>.
	 *
	 * @see feathers.display.Scale3Image
	 */
	public final class Scale3Textures
	{
		/**
		 * @private
		 */
		private static const SECOND_REGION_ERROR:String = "The size of the second region must be greater than zero.";

		/**
		 * @private
		 */
		private static const SUM_X_REGIONS_ERROR:String = "The combined height of the first and second regions must be less than or equal to the width of the texture.";

		/**
		 * @private
		 */
		private static const SUM_Y_REGIONS_ERROR:String = "The combined width of the first and second regions must be less than or equal to the height of the texture.";

		/**
		 * If the direction is horizontal, the layout will start on the left and continue to the right.
		 */
		public static const DIRECTION_HORIZONTAL:String = "horizontal";

		/**
		 * If the direction is vertical, the layout will start on the top and continue to the bottom.
		 */
		public static const DIRECTION_VERTICAL:String = "vertical";

		/**
		 * Constructor.
		 *
		 * @param texture			A Starling Texture to slice up into three regions. It is recommended to turn of mip-maps for best rendering results.
		 * @param firstRegionSize	The size, in pixels, of the first of the three regions. This value should be based on the original texture dimensions, with no adjustments for scale factor.
		 * @param secondRegionSize	The size, in pixels, of the second of the three regions. This value should be based on the original texture dimensions, with no adjustments for scale factor.
		 * @param direction			Indicates if the regions should be positioned horizontally or vertically.
		 */
		public function Scale3Textures(texture:Texture, firstRegionSize:Number, secondRegionSize:Number, direction:String = DIRECTION_HORIZONTAL)
		{
			if(secondRegionSize <= 0)
			{
				throw new ArgumentError(SECOND_REGION_ERROR);
			}
			var sumRegions:Number = firstRegionSize + secondRegionSize;
			if(direction === DIRECTION_HORIZONTAL)
			{
				if(sumRegions > texture.frameWidth)
				{
					throw new ArgumentError(SUM_X_REGIONS_ERROR);
				}
			}
			else if(sumRegions > texture.frameHeight) //vertical
			{
				throw new ArgumentError(SUM_Y_REGIONS_ERROR);
			}
			this._texture = texture;
			this._direction = direction;
			this._firstRegionSize = firstRegionSize;
			this._secondRegionSize = secondRegionSize;
			if(this._direction === DIRECTION_HORIZONTAL)
			{
				this._scale9Grid = new Rectangle(firstRegionSize, 0, secondRegionSize, texture.frameHeight);
			}
			else
			{
				this._scale9Grid = new Rectangle(0, firstRegionSize, texture.frameWidth, secondRegionSize);
			}
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
		 * The scale9Grid created from the regions.
		 */
		public function get scale9Grid():Rectangle
		{
			return this._scale9Grid;
		}

		/**
		 * @private
		 */
		private var _firstRegionSize:Number;

		/**
		 * The size of the first region, in pixels.
		 */
		public function get firstRegionSize():Number
		{
			return this._firstRegionSize;
		}

		/**
		 * @private
		 */
		private var _secondRegionSize:Number;

		/**
		 * The size of the second region, in pixels.
		 */
		public function get secondRegionSize():Number
		{
			return this._secondRegionSize;
		}

		/**
		 * @private
		 */
		private var _direction:String;

		/**
		 * The direction of the sub-texture layout.
		 *
		 * @default Scale3Textures.DIRECTION_HORIZONTAL
		 *
		 * @see #DIRECTION_HORIZONTAL
		 * @see #DIRECTION_VERTICAL
		 */
		public function get direction():String
		{
			return this._direction;
		}
	}
}
