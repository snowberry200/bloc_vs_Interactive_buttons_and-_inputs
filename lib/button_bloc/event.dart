abstract class UIControlEvent {}

// Button Events
class OnButtonPressed extends UIControlEvent {}

// Selection Events
class CheckboxToggled extends UIControlEvent {}

class SwitchToggled extends UIControlEvent {}

class RadioSelected extends UIControlEvent {
  int value;
  RadioSelected(this.value);
}

class DropdownChanged extends UIControlEvent {
  final String value;
  DropdownChanged(this.value);
}

// Slider & Progress Events
class SliderChanged extends UIControlEvent {
  final double value;
  SliderChanged(this.value);
}

// Multi-selection Events
class ToggleButtonsChanged extends UIControlEvent {
  final List<bool> isSelected;
  ToggleButtonsChanged(this.isSelected);
}
