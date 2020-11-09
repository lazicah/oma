import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oma/state/app/app_bloc.dart';
import 'package:oma/state/app/observer.dart';
import 'package:oma/ui/screens/main/main_scaffold.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Oma',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainView(),
      ),
    );
  }
}
