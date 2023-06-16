import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

String _basicAuth =
    'Basic ' + base64Encode(utf8.encode('faisal:mogacomedy2001'));

Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        print("Error , status code : ${response.statusCode}");
      }
    } catch (e) {
      print("catch error : $e");
    }
  }

  postRequest(String url, Map data) async {
    try {
      var response =
          await http.post(Uri.parse(url), body: data, headers: myheaders);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        print("Error , status code : ${response.statusCode}");
      }
    } catch (e) {
      print("catch error : $e");
    }
  }

  postFile(
      {required String url,
      required Map<String, dynamic> data,
      required String fileRequestName,
      required File file}) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));
      final fileLength = await file.length();
      final stream = http.ByteStream(file.openRead());
      final fileName = p.basename(file.path);
      final multipartFile = http.MultipartFile(
        fileRequestName,
        stream,
        fileLength,
        filename: fileName,
      );
      request.headers.addAll(myheaders);
      request.files.add(multipartFile);
      data.forEach((key, value) {
        request.fields[key] = value.toString();
      });
      var myRequest = await request.send();
      final response = await http.Response.fromStream(myRequest);
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        return responseBody;
      } else {
        print("Error : ${response.statusCode}");
      }
    } catch (e) {
      print('Error posting file: $e');
      return {'error': 'Failed to upload file: $e'};
    }
  }
}
