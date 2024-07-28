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
    options: FirebaseOptions(
        apiKey: "AIzaSyD6p4VWuYSAN2liaf2I-0sDzufpFir4pvI",
        authDomain: "grow-mood-4.firebaseapp.com",
        projectId: "grow-mood-4",
        storageBucket: "grow-mood-4.appspot.com",
        messagingSenderId: "656813039456",
        appId: "1:656813039456:web:2be54aa52fbe652a04c805"),
  );
  // Register an Interactivity Callback. It is necessary that this method is static and public
  await HomeWidget.registerInteractivityCallback(interactiveCallback);
  runApp( MyApp());
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
