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
    options: const FirebaseOptions(
      apiKey: "AIzaSyBOcB18iHneSsvSj0YxU3Y0HQopAvj8PDg",
      authDomain: "grow-mood.firebaseapp.com",
      projectId: "grow-mood",
      storageBucket: "grow-mood.appspot.com",
      messagingSenderId: "219145158027",
      appId: "1:219145158027:web:29791b11238d7b4d1c038e",
      measurementId: "G-LRJQGHJVD7",
    ),
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
