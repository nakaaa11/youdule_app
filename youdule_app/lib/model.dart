import 'package:flutter/material.dart';

class Album {
  final String title;
  final String description;
  final String thumbnails;
  final String channelId;
  final String channelTitle;

  const Album({
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelId,
    required this.channelTitle,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['items'][0]['snippet']['title'] as String,
      description: json['items'][0]['snippet']['description'] as String,
      thumbnails:
          json['items'][0]['snippet']['thumbnails']['default']['url'] as String,
      channelId: json['items'][0]['snippet']['channelId'] as String,
      channelTitle: json['items'][0]['snippet']['channelTitle'] as String,
    );
  }
}
