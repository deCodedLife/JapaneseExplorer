import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import '../Data/Channel.dart';
import '../Data/Video.dart';
import '../ApiKeys/keys.dart';

class APIService {

  final String _baseUrl = 'www.googleapis.com';
  String _nextPageToken = '';

  APIService._instantiate();
  static final APIService instance = APIService._instantiate();

  Future<List<Video>> fetchVideosFromPlaylist({String playlistID}) async {
    Map<String, String> parameters = {
      'part' : 'snippet',
      'playlistId' : playlistID,
      'maxResults' : '8',
      'pageToken' : _nextPageToken,
      'key' : YOUTUBE_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters
      );
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json'
      };

    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      _nextPageToken = data['nextPageToken'] ?? '';
      List<dynamic> videosJson = data['items'];
      List<Video> videos = [];
      videosJson.forEach(
        (json) => videos.add(Video.fromMap(json['snippet']))
      );
      return videos;
    } else throw json.decode(response.body)['error']['message'];
  }

  Future<Channel> fetchChannel({String channelID}) async {
    Map<String, String> parameters = {
      'part' : 'snippet, contentDetails, statistics',
      'id' : channelID,
      'key' : YOUTUBE_KEY,
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters
      );
      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: 'application/json'
      };

      var response = await get(uri, headers: headers);
      if(response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body)['items'][0];
        Channel channel = Channel.fromMap(data);
        channel.videos = await fetchVideosFromPlaylist (
          playlistID: channel.uploadPlayList,
        );
        return channel;
      } else {
        throw json.decode(response.body)['error']['message'];
      }

  }

}