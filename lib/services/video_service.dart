import 'package:http/http.dart' as http;
import 'package:my_first_app/models/video.dart';

Future<List<Video>> getVideoFromApi() async {
  final url = 'https://orangevalleycaa.org/api/videos';
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var json = response.body;
    return videoFromJson(json);
  } else {
    return [];
  }
}
