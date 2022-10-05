import 'dart:convert';

//import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'dart:html' as html;

class Api {
  Future<String> getDesks(String host) async {
    final url = Uri.parse("$host/api/v1/desks");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return response.body;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  getExcelFile(String host) async {
    final url = Uri.parse("$host/api/v1/excel");
    //final response = await http.post(url, body: {'title': 'Заголовок', 'counts': [30,54,23,11,66]});
    final counts = [30, 54, 23, 11, 66];
    Map<String, dynamic> args = {"title": "Заголовок", "counts": counts};
    var body = json.encode(args);
    print(body);
    final response = await http
        .post(url, body: body, headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      final stream = response.bodyBytes;
      final content = base64Encode(stream);
      final anchor = html.AnchorElement(
          href:
              "data:application/octet-stream;charset=utf-16le;base64,$content")
        ..setAttribute("download", "file.xlsx")
        ..click();
      return response.body;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  getWordFile(String host) async {
    final url = Uri.parse("$host/api/v1/word");
    final counts = [30, 54, 23, 11, 66];
    Map<String, dynamic> args = {"title": "Заголовок", "counts": counts};
    var body = json.encode(args);
    print(body);
    final response = await http
        .post(url, body: body, headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      final stream = response.bodyBytes;
      final content = base64Encode(stream);
      final anchor = html.AnchorElement(
          href:
              "data:application/octet-stream;charset=utf-16le;base64,$content")
        ..setAttribute("download", "file.docx")
        ..click();
      return response.body;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  uploadFile(
      Stream<List<int>> fileReadStream, int fileSize, String fileName, String host, String method) async {
    final stream = http.ByteStream(fileReadStream);
    final url = Uri.parse("$host/api/v1/$method");
    final mimeType = fileName != null ? lookupMimeType(fileName) : null;
    final contentType = mimeType != null ? MediaType.parse(mimeType) : null;
    var request = http.MultipartRequest("POST", url);
    request.files.add(http.MultipartFile('file', stream, fileSize,
        filename: fileName, contentType: contentType));
    final httpClient = http.Client();
    final response = await httpClient.send(request);

    if (response.statusCode != 200) {
      throw Exception('HTTP ${response.statusCode}');
    }

    final body = await response.stream.transform(utf8.decoder).join();

    print(body);
  }

  getEmailFile(String host,String text1, String text2, String text3, String text4,
      String text5,String text6) async {
    final url = Uri.parse("$host/api/v1/mail");
    Map<String, dynamic> args = {
      "title": "Заголовок",
      "from": text1,
      "to": text2,
      "reply": text3,
      "attach": text6,
      "content": text5,
      "subject":text4,
    };
    var body = json.encode(args);
    print(body);
    final response = await http
        .post(url, body: body, headers: {'Content-type': 'application/json'});
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      final stream = response.bodyBytes;
      final content = base64Encode(stream);
      final anchor = html.AnchorElement(
          href:
              "data:application/octet-stream;charset=utf-16le;base64,$content")
        ..setAttribute("download", "mail.eml")
        ..click();
      return response.body;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<String> getSiteData(String host) async {
    final url = Uri.parse("$host/api/v1/getsitedata");
    try {
      final response = await http.post(url);
      if (response.statusCode == 200) {
        // If the call to the server was successful, parse the JSON
        print(response.body);
        return response.body;
      } else {
        // If that call was not successful, throw an error.
        return "Error";
      }
    } catch (e) {
      print(e);
      return "Error";
    }
  }
}
