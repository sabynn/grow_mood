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
    name: "devlaginih",
    options: const FirebaseOptions(
        apiKey: "AIzaSyCefVpEk6D2eHtiMHwR41ApQfe_LfODrig",
        authDomain: "grow-mood-5.firebaseapp.com",
        projectId: "grow-mood-5",
        storageBucket: "grow-mood-5.appspot.com",
        messagingSenderId: "637551921844",
        appId: "1:637551921844:web:b8d7918ffd221f1890a5e1"),
  );
  // Register an Interactivity Callback. It is necessary that this method is static and public
  await HomeWidget.registerInteractivityCallback(interactiveCallback);
  runApp(MyApp());
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
