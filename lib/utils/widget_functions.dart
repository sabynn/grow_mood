import 'dart:io';

import 'package:grow_mood/models/mood.dart';
import 'package:grow_mood/states/global_state.dart';
import 'package:home_widget/home_widget.dart';
import 'package:grow_mood/constants/widget_keys.dart';

@pragma('vm:entry-point')
Future<void> interactiveCallback(Uri? uri) async {
  print('>>> $uri');
  String? job = uri?.host.replaceAll('_', ' ');
  // We check the host of the uri to determine which action should be triggered.
  if (MoodsList.contains(job)) {
    sendAndUpdateMood(job);
    moodRM.state.setMood(job!);
  }
}

/// Stores [value] in the Widget Configuration
Future<void> sendAndUpdateMood([String? value]) async {
  await HomeWidget.saveWidgetData(WidgetKeys.mood_keys, value);

  if (Platform.isAndroid) {
    // Update Glance Provider
    await HomeWidget.updateWidget(androidName: WidgetKeys.widget_name);
  }
}

/// Gets the currently stored Value
Future<int> get value async {
  final value = await HomeWidget.getWidgetData<int>(WidgetKeys.mood_keys,
      defaultValue: 0);
  return value!;
}
