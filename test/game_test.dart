import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_turetme/oyun_kelime_turetme.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(harfCarkiConfig.title.length, 33);
    expect(harfCarkiConfig.tagline.length, 33);
    for (final s in harfCarkiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(harfCarkiConfig.gameId, harfCarkiId);
    expect(harfCarkiRules.gameId, harfCarkiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(harfCarkiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: harfCarkiId, optionalMechanics: harfCarkiRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      harfCarkiRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(harfCarkiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
