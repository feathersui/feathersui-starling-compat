/*
feathers-compat
Copyright 2012-2016 Bowler Hat LLC. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.display
{
	import flash.geom.Rectangle;

	import starling.display.Image;
	import starling.textures.Texture;

	public class TiledImage extends Image
	{
		public function TiledImage(texture:Texture)
		{
			super(texture);
			this.tileGrid = new Rectangle();
		}
	}
}
