import 'dart:io';

import 'package:path/path.dart';

import '../../build_directory.dart';
import '../../flavor_strategy/flavor_provider.dart';
import '../../ref.dart';
import '../../utils/state_provider_future_extension.dart';
import '../../version/version_provider.dart';
import 'build_step.dart';

class ReplaceFlavorParamsStep extends BuildStep {
  @override
  Future<void> run() async {
    await super.run();

    final fullVersion = ref.read(versionProvider).substring(1);
    final flavor = (await ref.read(flavorProvider.future)).config;
    final applicationId = flavor.applicationId;
    final applicationName = flavor.applicationName;
    final deeplinkHost = flavor.applicationName;

    final build = fullVersion.split('+').last;
    final version = fullVersion.split('+').first;

    final replaceTable = [
      [
        ['pubspec.yaml'],
        ['999.999.999+999', fullVersion]
      ],
      [
        ['ios/Runner.xcodeproj/project.pbxproj'],
        ['999.999.999', version]
      ],
      [
        ['ios/Runner.xcodeproj/project.pbxproj'],
        ['999', build]
      ],
      [
        ['android/app/src/main/AndroidManifest.xml', 'ios/Runner/Info.plist'],
        ['dl_sample.com', deeplinkHost]
      ],
      [
        [
          'android/app/src/main/AndroidManifest.xml',
          'ios/Runner/Info.plist',
          'lib/main.dart'
        ],
        ['@Template.ApplicationName', applicationName]
      ],
      [
        [
          'android/app/build.gradle',
          'android/app/src/debug/AndroidManifest.xml',
          'android/app/src/main/AndroidManifest.xml',
          'android/app/src/main/kotlin/com/example/template/MainActivity.kt',
          'android/app/src/profile/AndroidManifest.xml',
          'android/fastlane/Appfile',
          'ios/Runner.xcodeproj/project.pbxproj',
          'ios/OneSignalNotificationServiceExtension/OneSignalNotificationServiceExtension.entitlements',
          'ios/Runner/Runner.entitlements',
        ],
        ['com.example.template', applicationId]
      ]
    ];

    for (final r in replaceTable) {
      for (final f in r[0]) {
        final content =
            File(join(ref.read(buildDirectoryProvider), f)).readAsStringSync();
        File(join(ref.read(buildDirectoryProvider), f))
            .writeAsStringSync(content.replaceAll(r[1][0], r[1][1]));
      }
    }
  }

  @override
  String get summary => 'replace configurable params in files';
}
