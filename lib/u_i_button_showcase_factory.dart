import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/button_bloc/bloc.dart';
import 'package:my_bloc/button_bloc/event.dart';
import 'package:my_bloc/button_bloc/state.dart';

class UiButtonShowcaseFactory {
  // ---------- BUTTONS ----------

  static Widget buildIconButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<UIControlBloc>().add(OnButtonPressed());
      },
      icon: Icon(Icons.favorite, color: Colors.red),
      tooltip: 'Likey',
    );
  }

  static Widget buildCheckbox(BuildContext context, UIState state) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        state.isLoading
            ? Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              )
            : Checkbox(
                value: state.isChecked,
                onChanged: (_) {
                  context.read<UIControlBloc>().add(CheckboxToggled());
                },
              ),

        Text('Checkbox'),
      ],
    );
  }
  // ---------- SWITCH ----------

  static Widget buildSwitch(BuildContext context, UIState state) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Switch(
          value: state.isSwitched,
          onChanged: (_) {
            context.read<UIControlBloc>().add(SwitchToggled());
          },
        ),
        Text('Switch'),
      ],
    );
  }

  // ---------- SELECTION ----------

  static Widget buildRadioGroup(BuildContext context, UIState state) {
    return Column(
      children: [
        Text('Radio Group:', style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<int>(
                  value: index,
                  groupValue: state.selectedRadio,
                  onChanged: (value) {
                    context.read<UIControlBloc>().add(RadioSelected(value!));
                  },
                ),
                Text('Option ${index + 1}'),
                SizedBox(width: 10),
              ],
            );
          }),
        ),
      ],
    );
  }

  static Widget buildDropdown(BuildContext context, UIState state) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: state.selectedDropdown,
        isExpanded: true,
        underline: SizedBox(),
        items: ['Option 1', 'Option 2', 'Option 3'].map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (newValue) {
          context.read<UIControlBloc>().add(DropdownChanged(newValue!));
        },
      ),
    );
  }

  // ---------- SLIDER ----------
  static Widget buildSlider(BuildContext context, UIState state) {
    return Column(
      children: [
        Slider(
          value: state.sliderValue,
          min: 0,
          max: 100,
          divisions: 10,
          label: '${state.sliderValue.round()}%',
          onChanged: (value) {
            context.read<UIControlBloc>().add(SliderChanged(value));
          },
        ),
        Text(
          'Value: ${state.sliderValue.round()}%',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // ---------- TOGGLE BUTTONS ----------
  static Widget buildToggleButtons(BuildContext context, UIState state) {
    return ToggleButtons(
      isSelected: state.toggleButtonsSelected,
      onPressed: (index) {
        List<bool> newSelection = List.from(state.toggleButtonsSelected);
        newSelection[index] = !newSelection[index];
        context.read<UIControlBloc>().add(ToggleButtonsChanged(newSelection));
      },
      children: [
        Icon(Icons.format_bold),
        Icon(Icons.format_italic),
        Icon(Icons.format_underline),
      ],
    );
  }

  // ---------- FAB ----------
  static Widget buildFAB(BuildContext context) {
    return BlocBuilder<UIControlBloc, UIState>(
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: state.isLoading
              ? null
              : () {
                  context.read<UIControlBloc>().add(OnButtonPressed());
                },
          child: state.isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Icon(Icons.add),
        );
      },
    );
  }
}
