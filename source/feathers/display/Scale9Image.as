/*
feathers-compat
Copyright 2012-2016 Bowler Hat LLC. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.display
{
	import feathers.textures.Scale9Textures;

	import starling.display.Image;

	/**
	 * Scales an image with nine regions to maintain the aspect ratio of the
	 * corners regions. The top and bottom regions stretch horizontally, and the
	 * left and right regions scale vertically. The center region stretches in
	 * both directions to fill the remaining space.
	 */
	public class Scale9Image extends Image
	{
		/**
		 * Constructor.
		 */
		public function Scale9Image(textures:Scale9Textures)
		{
			super(textures.texture);
			this.textures = textures;
		}

		/**
		 * @private
		 */
		private var _textures:Scale9Textures;

		/**
		 * The textures displayed by this image.
		 *
		 * <p>In the following example, the textures are changed:</p>
		 *
		 * <listing version="3.0">
		 * image.textures = new Scale9Textures( texture, scale9Grid );</listing>
		 */
		public function get textures():Scale9Textures
		{
			return this._textures;
		}

		/**
		 * @private
		 */
		public function set textures(value:Scale9Textures):void
		{
			if(this._textures === value)
			{
				return;
			}
			this._textures = value;
			if(this._textures !== null)
			{
				this.texture = this._textures.texture;
				this.scale9Grid = this._textures.scale9Grid;
			}
		}
	}
}
