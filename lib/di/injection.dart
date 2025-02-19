import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final GetIt sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',  // Custom initializer name (default is 'init')
  preferRelativeImports: true,  // Use relative imports (default is true)
  asExtension: true,  // Generate code as an extension (default is true)
)
void configureDependencies() => sl.init();
