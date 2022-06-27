import 'package:fitness/model/json_data.dart';
import 'package:http/http.dart' as http;

class JsonParseService {
  static const String url = 'https://jsonplaceholder.typicode.com/photos';

  static Future<List<PhotoAlbum>> getData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final List<PhotoAlbum> albumData = photoFromJson(response.body);
        return albumData;
      } else {
        return <PhotoAlbum>[];
      }
    } catch (e) {
      return <PhotoAlbum>[];
    }
  }
}
