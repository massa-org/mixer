import 'dart:async';

import 'package:args/command_runner.dart';
import 'package:dcli/dcli.dart';

import 'argument_parser.dart';
import 'steps/apply_flavor_overrides_step.dart';
import 'steps/configure_flavor_step.dart';
import 'steps/configure_mixer_step.dart';
import 'steps/show_flavor_list_step.dart';
import 'steps/substep_step.dart';

class SwitchFlavorCommand extends Command<void> {
  @override
  String get description => 'apply flavor overrides to project';

  @override
  String get name => 'switch';

  @override
  ArgParser get argParser => ArgParser()
    ..addOption(
      'flavor',
      help: 'which flavor apply',
    );

  @override
  FutureOr<void> run() async {
    final flavor = getFlavor(argResults);

    final step = SubstepStep(
      [
        ConfigureMixerStep(),
        if (flavor == null)
          ShowFlavorListStep('Flavor is not selected')
        else ...[
          ConfigureFlavorStep(userSelectedFlavor: flavor),
          ApplyFlavorOverridesStep(),
        ]
      ],
      name: 'SwitchConfig',
    );

    print(green('switch to flavor $pwd'));
    await step.run();
  }
}
