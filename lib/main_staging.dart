import 'core/config/flavor_config.dart';
import 'core/di/injection.dart';
import 'main.dart' as runner;

Future<void> main() async {
  // Use factory constructor
  FlavorConfig.staging();

  await configureDependencies();
  runner.main();
}
