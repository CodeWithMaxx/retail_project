import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final SecureStorageService _instance =
  SecureStorageService._internal();
  factory SecureStorageService() => _instance;
  SecureStorageService._internal();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> savePersonID(
      {required String key, required dynamic value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getPersonID({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  // ! delete user date 1 by 1 from SecureStorage

  Future<void> deleteData(String key) async {
    await _secureStorage.delete(key: key);
  }

  // ! delete all data from SecureStore in one shot

  Future<void> deleteAllData() async {
    await _secureStorage.deleteAll();
  }

  // ! save and get userID
  Future<void> savePersonName(
      {required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getPersonName({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  // ! save and get User Name

  Future<void> saveFactoryID(
      {required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getFactoryID({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  // ! save and get User Email

  Future<void> saveAddress({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getAddress({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  // ! save and get User Mobile

  Future<void> saveCity({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getCity({required String key}) async {
    return await _secureStorage.read(key: key);
  }

  // ! save and get Category

  Future<void> saveMobileNo(
      {required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getMobileNo({required String key}) async {
    return await _secureStorage.read(key: key);
  }
}
