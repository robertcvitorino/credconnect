import 'package:credconnect/core/shared/storage_preferences.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthController {
  final StoragePreferences storagePreferences;
   String? _name;
  String? get name => _name;

  AuthController({required this.storagePreferences});
  Future<bool> isLogged() async {
    final userId = await storagePreferences.read(key: 'user.id');
    _name = await storagePreferences.read(key: 'user.name');
    return userId != null;
  }

  Future<void> logout() async {
    await storagePreferences.deleteAll();
  }
}
