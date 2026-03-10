import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  Future<Map<String, String>> getRandomUser() async {
    try {
      final response = await http.get(Uri.parse('https://randomuser.me/api/'));
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
    } on Exception catch (_) {
      // Fallback
    }
    return {
      'name': 'Jay',
      'avatar': 'https://i.pravatar.cc/150?img=68',
    };
  }
}
