import 'package:credconnect/core/shared/storage_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage(
        aOptions: AndroidOptions(
          encryptedSharedPreferences: true,
        ),
      );
  @lazySingleton
  IFlutterStorage bindSecureStorage(FlutterSecureStorage storage) =>
      StoragePreferences( flutterStorage: storage);
}