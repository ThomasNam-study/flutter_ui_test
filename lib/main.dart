import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteruitest/provider/counter.dart';
import 'package:flutteruitest/screen/main_page.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  // BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MultiProvider(
    providers: <SingleChildWidget>[
      ChangeNotifierProvider(
        create: (BuildContext context) => Counter(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purred UI Tester',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}
