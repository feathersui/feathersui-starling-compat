/*
feathers-compat
Copyright 2012-2016 Bowler Hat LLC. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.display
{
	import feathers.layout.Direction;
	import feathers.textures.Scale3Textures;

	import flash.geom.Rectangle;

	import starling.display.Image;

	/**
	 * Scales an image like a "pill" shape with three regions, either
	 * horizontally or vertically. The edge regions scale while maintaining
	 * aspect ratio, and the middle region stretches to fill the remaining
	 * space.
	 */
	public class Scale3Image extends Image
	{
		/**
		 * Constructor.
		 */
		public function Scale3Image(textures:Scale3Textures)
		{
			super(textures.texture);
			this.textures = textures;
		}
		
		/**
		 * @private
		 */
		private var _textures:Scale3Textures;

		/**
		 * The textures displayed by this image.
		 *
		 * <p>In the following example, the textures are changed:</p>
		 *
		 * <listing version="3.0">
		 * image.textures = new Scale3Textures( texture, firstRegionWidth, secondRegionWidth, Scale3Textures.DIRECTION_HORIZONTAL );</listing>
		 */
		public function get textures():Scale3Textures
		{
			return this._textures;
		}

		/**
		 * @private
		 */
		public function set textures(value:Scale3Textures):void
		{
			if(this._textures === value)
			{
				return;
			}
			this._textures = value;
			if(this._textures !== null)
			{
				this.texture = this._textures.texture;
				if(this._textures.direction === Direction.VERTICAL)
				{
					this.scale9Grid = new Rectangle(0, this._textures.firstRegionSize,
						this._textures.texture.frameWidth, this._textures.secondRegionSize);
				}
				else // horizontal
				{
					this.scale9Grid = new Rectangle(this._textures.firstRegionSize, 0,
						this._textures.secondRegionSize, this._textures.texture.frameHeight);
				}
			}
		}
	}
}
