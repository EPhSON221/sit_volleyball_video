import 'package:http/http.dart' as http;

class URL {
  static String inputFormat(String url) {
    if (url.contains('&feature=youtu.be')) {
      return url.substring(0, url.length - 17);
    } else if (url.contains('https://youtu.be/')) {
      return 'https://www.youtube.com/watch?v=${url.substring(17)}';
    } else {
      return url;
    }
  }

  static String imageFormat(String url) {
    if(url.length<32) return 'wrong';
    return 'https://img.youtube.com/vi/${url.substring(32)}/mqdefault.jpg';
  }

  static Future<bool> isCollect(String url)async{
    final response = await http.get(url);
    if(response.statusCode == 200) return true;
    else return false;
  }
}
