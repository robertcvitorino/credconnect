// lib/core/di/injection.dart
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';
final sl = GetIt.instance;
@InjectableInit(
  initializerName: 'init', // O nome da função gerada no arquivo .config.dart
  preferRelativeImports: true, // Prefere usar importações relativas no código gerado
  asExtension: true, // Gera o código como uma extensão do GetIt, permitindo a sintaxe "sl.init()"
)
void configureDependencies() => sl.init();