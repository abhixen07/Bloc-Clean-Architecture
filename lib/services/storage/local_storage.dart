import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {

  // Secure storage ko initialize karna
  // Initialize secure storage
  final storage = const FlutterSecureStorage();

  // Diye gaye key ke sath value ko save karna
  // Save a value with the specified key
  Future<bool> setValue(String key, String value) async {
    await storage.write(key: key, value: value);  // Write data to secure storage
    return true;  // Return true to indicate success
  }

  // Diye gaye key ke sath associated value ko read karna
  // Read the value associated with the specified key
  Future<dynamic> readValue(String key) async {
    return await storage.read(key: key);  // Read data from secure storage
  }

  // Diye gaye key ke sath associated value ko clear karna
  // Clear the value associated with the specified key
  Future<bool> clearValue(String key) async {
    await storage.delete(key: key);  // Delete data from secure storage
    return true;  // Return true to indicate success
  }
}
