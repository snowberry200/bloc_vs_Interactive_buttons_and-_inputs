import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/button_bloc/bloc.dart';
import 'package:my_bloc/u_i_button_showcase.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UIControlBloc(),
      child: MaterialApp(
        title: 'BLoC Showcase',
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: UIButtonShowcase(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
