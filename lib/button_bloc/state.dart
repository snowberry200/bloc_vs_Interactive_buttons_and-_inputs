import 'package:equatable/equatable.dart';

class UIState extends Equatable {
  final bool isLoading;
  final String? loadingMessage;
  final bool isChecked;
  final bool isSwitched;
  final int selectedRadio;
  final String selectedDropdown;
  final double sliderValue;
  final List<bool> toggleButtonsSelected;
  final String lastAction;

  const UIState({
    this.isLoading = false,
    this.loadingMessage,
    this.isChecked = false,
    this.isSwitched = false,
    this.selectedRadio = 0,
    this.selectedDropdown = 'Option 1',
    this.sliderValue = 0,
    this.toggleButtonsSelected = const [false, false, false],
    this.lastAction = '',
  });

  UIState copyWith({
    bool? isLoading,
    String? loadingMessage,
    bool? isChecked,
    bool? isSwitched,
    int? selectedRadio,
    String? selectedDropdown,
    double? sliderValue,
    List<bool>? toggleButtonsSelected,
    String? lastAction,
  }) {
    return UIState(
      isLoading: isLoading ?? this.isLoading,
      loadingMessage: loadingMessage ?? this.loadingMessage,
      isChecked: isChecked ?? this.isChecked,
      isSwitched: isSwitched ?? this.isSwitched,
      selectedRadio: selectedRadio ?? this.selectedRadio,
      selectedDropdown: selectedDropdown ?? this.selectedDropdown,
      sliderValue: sliderValue ?? this.sliderValue,
      toggleButtonsSelected:
          toggleButtonsSelected ?? this.toggleButtonsSelected,
      lastAction: lastAction ?? this.lastAction,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    loadingMessage,
    isChecked,
    isSwitched,
    selectedRadio,
    selectedDropdown,
    sliderValue,
    toggleButtonsSelected,
    lastAction,
  ];
}
