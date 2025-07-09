import 'package:http/http.dart' as http;
import 'import_export.dart';

class GetxRestApiService {
  static const String baseUrl = 'https://67c3db4c89e47db83dd2a1c3.mockapi.io/API_CRUD';

  Future<List<GetxRestApiModel>> fetchData() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => GetxRestApiModel.fromMap(item)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
