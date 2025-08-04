import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

abstract interface class IFlutterStorage {
  Future write({required String key, required String value});
  Future read({required String key});
  Future delete({required String key});
  Future deleteAll();
}
@lazySingleton
class StoragePreferences implements IFlutterStorage {
  final FlutterSecureStorage flutterStorage;

  StoragePreferences({required this.flutterStorage});
  @override
  Future read({required String key}) async {
    final result = await flutterStorage.read(key: key);
    return result;
  }

  @override
  Future write({required String key, required String value}) async {
    await flutterStorage.write(key: key, value: value);
  }

  @override
  Future delete({required String key}) async {
    await flutterStorage.delete(key: key);
  }

  @override
  Future deleteAll() async {
    await flutterStorage.deleteAll();
  }
}
