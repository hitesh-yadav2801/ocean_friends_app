import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ocean_friends_app/di/injection.config.dart';

/// Global [GetIt] service locator instance.
///
/// Access registered dependencies anywhere via `sl<SomeClass>()`.
final GetIt sl = GetIt.instance;

/// Registers all application dependencies.
///
/// Call this once at app startup before [runApp].
/// Injectable generates the body of [_$configureDependencies] in [injection.config.dart].
@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
)
Future<void> configureDependencies() async => sl.$initGetIt();
