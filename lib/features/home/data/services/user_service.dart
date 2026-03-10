import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class UserService {
  /// Fetches a random user profile.
  /// Returns a map with 'name' and 'avatar' or null if the request fails.
  Future<Map<String, String>?> getRandomUser() async {
    try {
      final response = await http
          .get(Uri.parse('https://randomuser.me/api/'))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        final results = data['results'] as List<dynamic>;
        if (results.isNotEmpty) {
          final user = results[0] as Map<String, dynamic>;
          final name = user['name'] as Map<String, dynamic>;
          final picture = user['picture'] as Map<String, dynamic>;

          return {
            'name': name['first'] as String,
            'avatar': picture['large'] as String,
          };
        }
      }
      return null;
    } catch (e) {
      // Log error in a real app
      return null;
    }
  }
}
