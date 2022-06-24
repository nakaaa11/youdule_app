import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';

Future<Album> fetchAlbum() async {
  // final ids = ["yTb_AvLchgY", '1FliVTcX8bQ', '_wZfYtYwxro', 'ZHAnZTVF_10'];
  final id = "_wZfYtYwxro";
  final key = "AIzaSyDqPx4nsLzg3ttJfKv1pJ_Ex4pZ4gjdYGw";
  final part = "snippet";
  //final part = "snippet,contentDetails,statistics,status"

  // var response = [];

  var url = Uri.parse(
      'https://www.googleapis.com/youtube/v3/videos?id=${id}&key=${key}&part=${part}');
  var response = await http.get(url);
  // response.add(Album.fromJson(jsonDecode(r.toString())));
  // return Album.fromJson(jsonDecode());

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
