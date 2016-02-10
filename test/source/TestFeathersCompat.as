package
{
	import feathers.compat.tests.ImageStateValueSelectorTests;
	import feathers.compat.tests.Scale3TexturesTests;
	import feathers.compat.tests.Scale9ImageStateValueSelectorTests;
	import feathers.compat.tests.SmartDisplayObjectStateValueSelectorTests;
	import feathers.compat.tests.StateValueSelectorTests;
	import feathers.compat.tests.StateWithToggleValueSelectorTests;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.system.System;

	import org.flexunit.internals.TraceListener;
	import org.flexunit.listeners.CIListener;
	import org.flexunit.runner.FlexUnitCore;

	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.Event;

	[SWF(width="960",height="640",frameRate="60",backgroundColor="#4a4137")]
	public class TestFeathersCompat extends flash.display.Sprite
	{
		public static var starlingRoot:starling.display.Sprite;

		public function TestFeathersCompat()
		{
			if(this.stage)
			{
				this.stage.align = StageAlign.TOP_LEFT;
				this.stage.scaleMode = StageScaleMode.NO_SCALE;
			}

			this.loaderInfo.addEventListener(flash.events.Event.COMPLETE, loaderInfo_completeHandler);
		}

		private var _starling:Starling;
		private var _flexunit:FlexUnitCore;

		private function loaderInfo_completeHandler(event:flash.events.Event):void
		{
			Starling.multitouchEnabled = true;
			this._starling = new Starling(starling.display.Sprite, this.stage);
			this._starling.addEventListener(starling.events.Event.ROOT_CREATED, starling_rootCreatedHandler);
			this._starling.start();
		}

		private function starling_rootCreatedHandler(event:starling.events.Event):void
		{
			starlingRoot = starling.display.Sprite(this._starling.root);
			this._flexunit = new FlexUnitCore();
			this._flexunit.addListener(new TraceListener());
			this._flexunit.addListener(new CIListener());
			this._flexunit.addEventListener(FlexUnitCore.TESTS_COMPLETE, flexunit_testsCompleteHandler);
			this._flexunit.run(
			[
				Scale3TexturesTests,
				StateValueSelectorTests,
				StateWithToggleValueSelectorTests,
				SmartDisplayObjectStateValueSelectorTests,
				Scale9ImageStateValueSelectorTests,
				ImageStateValueSelectorTests,
			]);
		}

		private function flexunit_testsCompleteHandler(event:flash.events.Event):void
		{
			System.exit(0);
		}

	}
}