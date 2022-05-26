import 'package:test_app/data/model/news_model.dart';
import 'package:http/http.dart' as http;


class NewsRepository {
  final String _baseUrl = "https://api.publicapis.org/entries";

  Future<NewsModel> getNews() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return newsModelFromJson(response.body);
    } else {
      throw Exception("Failed to load news");
    }
  }
}
