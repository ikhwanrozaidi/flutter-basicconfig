import 'core/config/flavor_config.dart';
import 'core/di/injection.dart';
import 'main.dart' as runner;

Future<void> main() async {
  // Use factory constructor
  FlavorConfig.development();

  await configureDependencies();
  runner.main();
}
