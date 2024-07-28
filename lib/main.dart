import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grow_mood/feature/pages/splash_screen.dart';
import 'package:grow_mood/states/global_state.dart';
import 'package:home_widget/home_widget.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'utils/widget_functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "aaa",
    options: const FirebaseOptions(
        apiKey: "AIzaSyC78omBJt8G6dVrinnso2_OI4dXGgzHSMU",
        authDomain: "grow-mood-2.firebaseapp.com",
        projectId: "grow-mood-2",
        storageBucket: "grow-mood-2.appspot.com",
        messagingSenderId: "78373634591",
        appId: "1:78373634591:web:9634f738684b37e0180b2a",
        measurementId: "G-ZYLMGS6V35"),
  );
  // Register an Interactivity Callback. It is necessary that this method is static and public
  await HomeWidget.registerInteractivityCallback(interactiveCallback);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: GlobalState.injectData(),
      builder: (context) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FoodMood',
          home: SplashScreen(),
        );
      },
    );
  }
}
