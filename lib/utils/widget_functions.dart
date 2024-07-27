import 'dart:io';

import 'package:home_widget/home_widget.dart';
import 'package:grow_mood/constants/widget_keys.dart';

@pragma('vm:entry-point')
Future<void> interactiveCallback(Uri? uri) async {
  // We check the host of the uri to determine which action should be triggered.
  if (uri?.host == 'very_unpleasant') {
    print(">>> very_unpleasant ");
  } else if (uri?.host == 'unpleasant') {
    print(">>> unpleasant ");
  } else if (uri?.host == 'neutral') {
    print(">>> neutral ");
  } else if (uri?.host == 'pleasant') {
    print(">>> pleasant ");
  } else if (uri?.host == 'very_pleasant') {
    print(">>> very_unpleasant ");
  }

  sendAndUpdate(uri?.host.replaceAll('_', ' '));
}

/// Stores [value] in the Widget Configuration
Future<void> sendAndUpdate([String? value]) async {
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
