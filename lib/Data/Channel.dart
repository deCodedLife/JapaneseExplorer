import 'Video.dart';

class Channel {

  final String id;
  final String title;
  final String pictureUrl;
  final String subscribers;
  final String videoCount;
  final String uploadPlayList;

  List<Video> videos;

  Channel ({
    this.id,
    this.title,
    this.pictureUrl,
    this.subscribers,
    this.videoCount,
    this.uploadPlayList,
    this.videos
  });

  factory Channel.fromMap(Map<String, dynamic> map) {
    return Channel (
      id: map['id'],
      title: map['snippet']['title'],
      pictureUrl: map['snippet']['thumbnails']['default']['url'],
      subscribers: map['statistics']['subscriberCount'],
      videoCount: map['statistics']['videoCount'],
      uploadPlayList: map['contentDetails']['relatedPlaylists']['uploads']
    );
  }

}