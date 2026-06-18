import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/button_bloc/event.dart';
import 'package:my_bloc/button_bloc/state.dart';

class UIControlBloc extends Bloc<UIControlEvent, UIState> {
  UIControlBloc() : super(const UIState()) {
    on<OnButtonPressed>(_onButtonPressed);
    on<CheckboxToggled>(_onCheckboxToggled);
    on<SwitchToggled>(_onSwitchToggled);
    on<RadioSelected>(_onRadioSelected);
    on<DropdownChanged>(_onDropdownChanged);
    on<SliderChanged>(_onSliderChanged);
    on<ToggleButtonsChanged>(_onToggleButtonsChanged);
  }

  void _onButtonPressed(OnButtonPressed event, Emitter<UIState> emit) async {
    // Show loading
    emit(state.copyWith(loadingMessage: 'Processing click...'));

    await Future.delayed(const Duration(seconds: 1));

    // Update state
    emit(state.copyWith(isLoading: false, lastAction: 'Button clicked!'));
  }

  void _onCheckboxToggled(CheckboxToggled event, Emitter<UIState> emit) async {
    emit(
      state.copyWith(isLoading: true, loadingMessage: 'Updating checkbox...'),
    );

    await Future.delayed(const Duration(milliseconds: 1000));

    emit(
      state.copyWith(
        isLoading: false,
        isChecked: !state.isChecked,
        lastAction: 'Checkbox changed to ${!state.isChecked}',
      ),
    );
  }

  void _onSwitchToggled(SwitchToggled event, Emitter<UIState> emit) async {
    emit(state.copyWith(loadingMessage: 'Updating switch...'));

    await Future.delayed(const Duration(milliseconds: 100));

    emit(
      state.copyWith(
        isLoading: false,
        isSwitched: !state.isSwitched,
        lastAction: 'Switch changed to ${!state.isSwitched}',
        loadingMessage: null,
      ),
    );
  }

  void _onRadioSelected(RadioSelected event, Emitter<UIState> emit) async {
    emit(state.copyWith(loadingMessage: 'Selecting radio...'));

    await Future.delayed(const Duration(milliseconds: 100));

    emit(
      state.copyWith(
        isLoading: false,
        selectedRadio: event.value,
        lastAction: 'Radio selected: ${event.value}',
        loadingMessage: null,
      ),
    );
  }

  void _onDropdownChanged(DropdownChanged event, Emitter<UIState> emit) async {
    emit(state.copyWith(loadingMessage: 'Changing dropdown...'));

    await Future.delayed(const Duration(milliseconds: 100));

    emit(
      state.copyWith(
        isLoading: false,
        selectedDropdown: event.value,
        lastAction: 'Dropdown changed to ${event.value}',
      ),
    );
  }

  void _onSliderChanged(SliderChanged event, Emitter<UIState> emit) async {
    emit(state.copyWith(loadingMessage: 'Updating slider...'));

    await Future.delayed(const Duration(milliseconds: 100));

    emit(
      state.copyWith(
        isLoading: false,
        sliderValue: event.value.toDouble(),
        lastAction: 'Slider value: ${event.value}',
      ),
    );
  }

  void _onToggleButtonsChanged(
    ToggleButtonsChanged event,
    Emitter<UIState> emit,
  ) async {
    emit(state.copyWith(loadingMessage: 'Updating toggle buttons...'));

    await Future.delayed(const Duration(milliseconds: 100));

    emit(
      state.copyWith(
        isLoading: false,
        toggleButtonsSelected: event.isSelected,
        lastAction: 'Toggle buttons updated!',
        loadingMessage: null,
      ),
    );
  }
}
