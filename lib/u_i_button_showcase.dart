import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/section_header.dart';
import 'package:my_bloc/button_bloc/bloc.dart';
import 'package:my_bloc/button_bloc/state.dart';
import 'package:my_bloc/u_i_button_showcase_factory.dart';

class UIButtonShowcase extends StatelessWidget {
  const UIButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Button & Input Showcase'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<UIControlBloc, UIState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status Bar
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '📢 ${state.lastAction}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 24),

                // SECTION 1: BUTTONS (Loading Pattern)
                SectionHeader('🔘 Buttons (Loading Pattern)'),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    // IconButton
                    UiButtonShowcaseFactory.buildIconButton(context),
                  ],
                ),
                SizedBox(height: 24),

                // ==========================================
                // SECTION 2: SELECTION (Toggle Pattern)
                // ==========================================
                SectionHeader('☑️ Selection Widgets (Toggle Pattern)'),

                // Checkbox & Switch Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    UiButtonShowcaseFactory.buildCheckbox(context, state),
                    UiButtonShowcaseFactory.buildSwitch(context, state),
                  ],
                ),
                SizedBox(height: 16),

                // Radio Group
                UiButtonShowcaseFactory.buildRadioGroup(context, state),
                SizedBox(height: 16),

                // Dropdown
                UiButtonShowcaseFactory.buildDropdown(context, state),
                SizedBox(height: 24),

                // ==========================================
                // SECTION 3: SLIDER (Continuous Pattern)
                // ==========================================
                SectionHeader('🎚️ Slider (Continuous Pattern)'),
                UiButtonShowcaseFactory.buildSlider(context, state),
                SizedBox(height: 24),

                // ==========================================
                // SECTION 4: MULTI-TOGGLE (List Pattern)
                // ==========================================
                SectionHeader('🔲 Toggle Buttons (List Pattern)'),
                UiButtonShowcaseFactory.buildToggleButtons(context, state),
                SizedBox(height: 24),

                // ==========================================
                // SECTION 5: FAB (Floating Pattern)
                // ==========================================
                SectionHeader(' FloatingActionButton (Floating Pattern)'),
                SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
      floatingActionButton: UiButtonShowcaseFactory.buildFAB(context),
    );
  }

  // ==========================================
  // WIDGET BUILDERS
  // ==========================================
}
