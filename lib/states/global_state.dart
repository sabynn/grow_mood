import 'package:grow_mood/states/mood_state.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'account_state.dart';

final accountRM = RM.inject(
  () => AccountState(),
  autoDisposeWhenNotUsed: false,
);

final moodRM = RM.inject(
      () => MoodState(),
  autoDisposeWhenNotUsed: false,
);

class GlobalState {
  static List<Injectable> injectData() {
    return <Injectable>[
      Inject(
        () => AccountState(),
      ),
      Inject(
        () => MoodState(),
      ),
    ];
  }
}
