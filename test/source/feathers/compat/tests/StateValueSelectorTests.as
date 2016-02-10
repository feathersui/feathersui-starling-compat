package feathers.compat.tests
{
	import feathers.skins.StateValueSelector;

	import org.flexunit.Assert;

	public class StateValueSelectorTests
	{
		private static const STATE_ONE:String = "stateOne";
		private static const STATE_TWO:String = "stateTwo";

		private var _valueSelector:StateValueSelector;

		[Before]
		public function prepare():void
		{
			this._valueSelector = new StateValueSelector();
		}

		[After]
		public function cleanup():void
		{
			this._valueSelector = null;
		}

		[Test]
		public function testUpdateValue():void
		{
			var defaultValue:String = "Hello World";
			var stateOneValue:Number = 12;

			this._valueSelector.defaultValue = defaultValue;
			this._valueSelector.setValueForState(stateOneValue, STATE_ONE);

			var result:Object = this._valueSelector.updateValue({}, STATE_ONE, null);
			Assert.assertStrictlyEquals("StateValueSelector did not return correct value for setValueForState()", result, stateOneValue);

			var secondResult:Object = this._valueSelector.updateValue({}, STATE_TWO, result);
			Assert.assertFalse("StateValueSelector incorrectly reused result", result === secondResult);
			Assert.assertStrictlyEquals("StateValueSelector did not return correct value for defaultValue", secondResult, defaultValue);
		}
	}
}
