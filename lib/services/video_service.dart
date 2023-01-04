import 'package:http/http.dart' as http;
import 'package:my_first_app/models/video.dart';
import 'package:my_first_app/utils/helper.dart';

Future<List<Video>> getVideoFromApi({VideoSort filter = VideoSort.id}) async {
  final url =
      'https://orangevalleycaa.org/api/videos/order/${filter.filterName()}';
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var json = response.body;
    return videoFromJson(json);
  } else {
    return [];
  }
}
